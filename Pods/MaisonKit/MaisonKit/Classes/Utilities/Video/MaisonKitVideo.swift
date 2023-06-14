// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

/// Video view receives a source and plays a video
public struct MaisonKitVideo: View {

    private let source: VideoSource
    private let autoPlay: Bool
    private let isMuted: Bool

    /// Creates a new MaisonKitVideo view
    /// - Parameters:
    ///   - source: the source of the video
    ///   - autoPlay: whether or not the video should auto-play. Defaults to `true`.
    ///   - isMuted: whether the video should be muted or not. Defaults to `false`.
    public init(source: VideoSource,
                autoPlay: Bool = true,
                isMuted: Bool = false) {
        self.source = source
        self.autoPlay = autoPlay
        self.isMuted = isMuted
    }

    public var body: some View {
        ZStack {
            LoadingView()
            PlayerViewRepresentable(source: self.source, autoPlay: self.autoPlay, loop: true, isMuted: self.isMuted)
        }
    }
}
