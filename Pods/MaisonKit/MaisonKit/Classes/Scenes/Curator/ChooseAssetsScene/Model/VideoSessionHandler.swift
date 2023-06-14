// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import AVFoundation

final class VideoSessionHandler {
    /// The session for video-capture.
    let session: AVCaptureSession = {
        let session = AVCaptureSession()
        // Not having this line can sometimes crash the app with
        // Terminating app due to uncaught exception 'NSInvalidArgumentException',
        // reason: '*** -[AVCaptureDevice setActiveColorSpace:] Not supported - use activeFormat.supportedColorSpaces
        session.automaticallyConfiguresCaptureDeviceForWideColor = false
        return session
    }()

    private static let defaultVideoDevice: AVCaptureDevice? = {
        let types: [AVCaptureDevice.DeviceType] = [.builtInTripleCamera,
                                                   .builtInDualCamera,
                                                   .builtInDualWideCamera,
                                                   .builtInWideAngleCamera]
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: types, mediaType: .video, position: .back)

        return discoverySession.devices.first
    }()

    static var canShowCameraFeed: Bool {
        return self.defaultVideoDevice != nil
    }

    private let sessionQueue = DispatchQueue(label: "MaisonKit.VideoSessionHandler.CameraQueue", qos: .background)

    private var isConfigured = false

    init() {
        NotificationCenter.default.addObserver(forName: .AVCaptureSessionRuntimeError,
                                               object: self.session,
                                               queue: nil) { [weak self] _ in
            self?.stopCapturingVideo()
        }
        NotificationCenter.default.addObserver(forName: .AVCaptureSessionInterruptionEnded,
                                               object: self.session,
                                               queue: nil) { [weak self] _ in
            self?.startCapturingVideo()
        }
    }

    func configureCameraSession(onDone: @escaping () -> Void) {
        self.sessionQueue.async {
            if self.isConfigured { return }
            self.session.beginConfiguration()
            defer {
                self.session.commitConfiguration()
            }

            // We don't need high quality for this session, since it will be shown in a small preview
            self.session.sessionPreset = .cif352x288

            // Add video input.
            do {
                guard let videoDevice = Self.defaultVideoDevice else {
                    print("Default video device is unavailable.")
                    return
                }

                let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice)

                if self.session.canAddInput(videoDeviceInput) {
                    self.session.addInput(videoDeviceInput)
                } else {
                    print("Couldn't add video device input to the session.")
                    return
                }
                self.isConfigured = true
                DispatchQueue.main.async {
                    onDone()
                }
            } catch {
                print("Couldn't create video device input: \(error)")
                return
            }
        }
    }

    func startCapturingVideo() {
        self.sessionQueue.async {
            if self.session.isRunning || !self.isConfigured { return }
            self.session.startRunning()
        }
    }

    func stopCapturingVideo() {
        self.sessionQueue.async {
            if !self.session.isRunning { return }
            self.session.stopRunning()
        }
    }

    deinit {
        self.session.stopRunning()
    }
}
