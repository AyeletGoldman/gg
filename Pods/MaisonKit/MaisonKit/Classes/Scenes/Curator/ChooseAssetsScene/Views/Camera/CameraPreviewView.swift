// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import AVFoundation

struct CameraPreviewView: UIViewRepresentable {

    final class VideoPreviewView: UIView {

        var onRemoveFromSuperview: (() -> Void)?
        var onAddToSuperview: (() -> Void)?

        override class var layerClass: AnyClass {
             return AVCaptureVideoPreviewLayer.self
        }

        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            // swiftlint:disable:next force_cast
            return layer as! AVCaptureVideoPreviewLayer
        }

        override func willMove(toSuperview newSuperview: UIView?) {
            super.willMove(toSuperview: newSuperview)
            if newSuperview == nil {
                self.onRemoveFromSuperview?()
            } else {
                self.onAddToSuperview?()
            }
        }
    }

    final class Coordinator {
        private let sessionHandler = VideoSessionHandler()

        var session: AVCaptureSession {
            return self.sessionHandler.session
        }

        func configureCameraSession(onDone: @escaping () -> Void) {
            self.sessionHandler.configureCameraSession(onDone: onDone)
        }

        func startVideo() {
            self.sessionHandler.startCapturingVideo()
        }

        func stopVideo() {
            self.sessionHandler.stopCapturingVideo()
        }

        func restartVideo() {
            self.sessionHandler.stopCapturingVideo()
            self.sessionHandler.startCapturingVideo()
        }

        deinit {
            self.sessionHandler.stopCapturingVideo()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func makeUIView(context: Context) -> VideoPreviewView {

        let view = VideoPreviewView()
        view.onRemoveFromSuperview = {
            context.coordinator.stopVideo()
        }
        view.onAddToSuperview = {
            context.coordinator.startVideo()
        }
        context.coordinator.configureCameraSession {
            view.videoPreviewLayer.session = context.coordinator.session
            view.videoPreviewLayer.connection?.videoOrientation = .portrait
            view.videoPreviewLayer.videoGravity = .resizeAspectFill
        }
        return view
    }

    func updateUIView(_ uiView: VideoPreviewView, context: Context) { }
}
