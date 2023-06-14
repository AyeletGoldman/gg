// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import AVFoundation
import UIKit
import SwiftUI

struct BarcodeScannerCameraView: UIViewRepresentable {

    private let onFoundReference: (ProductReference) -> Void
    private let metadataObjectTypes: [AVMetadataObject.ObjectType]

    init(metadataObjectTypes: [AVMetadataObject.ObjectType] = [.ean8, .ean13, .upce],
         onFound: @escaping (ProductReference) -> Void) {
        self.onFoundReference = onFound
        self.metadataObjectTypes = metadataObjectTypes
    }

    func makeUIView(context: Context) -> ScannerView {
        let view = ScannerView()
        view.metadataObjectTypes = self.metadataObjectTypes
        view.onFoundReference = self.onFoundReference
        return view
    }

    func updateUIView(_ uiView: ScannerView, context: Context) { }
}

final class ScannerView: UIView {
    private var captureSession: AVCaptureSession?
    private var previewLayer: CALayer?

    var onFoundReference: ((ProductReference) -> Void)?
    var metadataObjectTypes: [AVMetadataObject.ObjectType] = []

    private func setup() {
        self.backgroundColor = .clear
        guard let captureSession = self.buildCaptureSession() else { return }
        self.captureSession = captureSession

        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        self.layer.addSublayer(previewLayer)
        self.previewLayer = previewLayer

        DispatchQueue.global().async {
            captureSession.startRunning()
        }
    }

    private func buildCaptureSession() -> AVCaptureSession? {
        let captureSession = AVCaptureSession()

        // Input
        guard let videoInput = self.deviceInput() else { return nil }
        guard captureSession.canAddInput(videoInput) else { return nil }
        captureSession.addInput(videoInput)

        // Output
        let metadataOutput = AVCaptureMetadataOutput()
        guard captureSession.canAddOutput(metadataOutput) else { return nil }
        captureSession.addOutput(metadataOutput)

        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        let types = self.metadataObjectTypes.filter { metadataOutput.availableMetadataObjectTypes.contains($0) }
        metadataOutput.metadataObjectTypes = types

        return captureSession
    }

    private func deviceInput() -> AVCaptureDeviceInput? {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return nil }
        return try? AVCaptureDeviceInput(device: videoCaptureDevice)
    }

    deinit {
        self.captureSession?.stopRunning()
    }
}

extension ScannerView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.frame = self.bounds
        self.previewLayer?.frame = self.bounds
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if self.superview == nil, let captureSession {
            // We left the view hierarchy
            if captureSession.isRunning {
                DispatchQueue.global().async {
                    captureSession.stopRunning()
                }
            }
        } else {
            self.setup()
        }
    }
}

extension ScannerView: AVCaptureMetadataOutputObjectsDelegate {

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        DispatchQueue.global().async {
            self.captureSession?.stopRunning()
        }

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            self.onFoundReference?(stringValue)
        }
    }
}
