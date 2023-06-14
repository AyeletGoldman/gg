// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import Foundation
import AVKit

struct PlayerViewRepresentable: UIViewRepresentable {

    private let source: VideoSource
    private let autoPlay: Bool
    private let loop: Bool
    private let isMuted: Bool

    init(source: VideoSource, autoPlay: Bool = false, loop: Bool = false, isMuted: Bool = false) {
        self.source = source
        self.autoPlay = autoPlay
        self.loop = loop
        self.isMuted = isMuted
    }

    func updateUIView(_ uiView: VideoPlayerView, context: Context) {
        if self.autoPlay {
            uiView.play()
        }
    }

    func makeUIView(context: Context) -> VideoPlayerView {
        return VideoPlayerView(source: self.source, autoPlay: self.autoPlay, loop: self.loop, isMuted: self.isMuted)
    }
}

final class VideoPlayerView: UIView {

    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    private var player: AVPlayer?

    private let autoPlay: Bool
    private let loop: Bool
    private let isMuted: Bool
    private var forceStopped = false
    private var backgroundToken: NSObjectProtocol?
    private var foregroundToken: NSObjectProtocol?
    private var playerObservationToken: NSKeyValueObservation?

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(source: VideoSource, autoPlay: Bool = false, loop: Bool = false, isMuted: Bool = false) {

        self.autoPlay = autoPlay
        self.loop = loop
        self.isMuted = isMuted

        super.init(frame: .zero)

        switch source {
        case .url(let url):
            self.configureLayer(with: AVPlayerItem(url: url))
        case .closure(let closure):
            closure { [weak self] playerItem in
                guard let playerItem = playerItem else { return }
                self?.configureLayer(with: playerItem)
            }
        }
    }

    private func configureLayer(with item: AVPlayerItem) {
        // Setup the player
        let player = AVQueuePlayer(items: [item])
        player.isMuted = self.isMuted
        self.playerLayer.player = player
        self.playerLayer.videoGravity = .resizeAspectFill
        self.layer.addSublayer(self.playerLayer)

        // Create a new player looper with the queue player and template item
        if self.loop {
            self.playerLooper = AVPlayerLooper(player: player, templateItem: item)
        }

        // Start the video if we are auto-playing
        if autoPlay {
            player.play()
        }

        self.player = player
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.playerLayer.frame = self.bounds
    }

    override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview == nil {
            self.removeNotificationObserver()
        } else {
            self.registerForNotification()
        }
    }
}

// MARK: - Notifications
private extension VideoPlayerView {
    /// When the application goes to the backgound, automatically the video is paused
    /// So we register for the notification for when the application becomes active
    /// and if we are meant to auto-play we restart the playback
    func registerForNotification() {
        self.backgroundToken = NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification,
                                                                      object: nil,
                                                                      queue: nil) { [weak self] _ in
            self?.pause()
        }

        self.foregroundToken = NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification,
                                                                      object: nil,
                                                                      queue: nil) { [weak self] _ in
            if self?.autoPlay == true {
                self?.play()
            }
        }

        // Sometimes, the system will stop the video. For example, if a different controller is
        // presented on top of the one that this view belongs to.
        // However, the system won't then re-start the video when the controller is dismissed.
        // This leaves us with a state where the video is stopped but cannot be restarted.
        // So, as a workaround, if the player is set to auto-play and it hasn't been "force stopped"
        // (i.e. by calling `pause()`) we re-start the player when it is stopped.
        self.playerObservationToken = self.player?.observe(\.rate, options: .new) { playerView, change in
            if change.newValue == 0 && self.autoPlay && !self.forceStopped {
                DispatchQueue.main.async {
                    playerView.play()
                }
            }
        }
    }

    func removeNotificationObserver() {
        if let backgroundToken = self.backgroundToken {
            NotificationCenter.default.removeObserver(backgroundToken)
        }
        if let foregroundToken = self.foregroundToken {
            NotificationCenter.default.removeObserver(foregroundToken)
        }
        self.playerObservationToken?.invalidate()
    }
}

// MARK: - Controls

extension VideoPlayerView {
    func play() {
        self.player?.play()
        self.forceStopped = false
    }

    func pause() {
        self.player?.pause()
        self.forceStopped = true
    }
}
