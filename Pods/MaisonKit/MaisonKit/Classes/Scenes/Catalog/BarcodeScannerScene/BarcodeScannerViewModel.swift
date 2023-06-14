//  Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine
import AVFoundation

final class BarcodeScannerViewModel: ObservableObject {

    private let onCancel: () -> Void
    private let onDone: (ProductReference) -> Void
    private let urlOpener: URLOpener

    private var cancellables = Set<AnyCancellable>()
    @Published var authorizationStatus: AVAuthorizationStatus

    init(urlOpener: URLOpener = UIApplication.shared,
         onCancel: @escaping () -> Void,
         onDone: @escaping (ProductReference) -> Void) {
        self.urlOpener = urlOpener
        self.onDone = onDone
        self.onCancel = onCancel

        self.authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
    }

    func didTapCancel() {
        self.onCancel()
    }

    func didTapGrantAccess() {
        if self.authorizationStatus == .denied || self.authorizationStatus == .restricted {
            self.urlOpener.openAppSettingsURL()
        } else {
            AVCaptureDevice.requestAccess(for: .video)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] _ in
                    self?.authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
                }.store(in: &self.cancellables)
        }
    }

    func didFindProductReference(_ reference: ProductReference) {
        HapticGenerator.success()
        self.onDone(reference)
    }
}
