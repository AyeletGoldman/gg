// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A protocol to present the barcode scanner scene
public protocol BarcodeScannerPresenterRouter {

    /// Presents the barcode scanner UI
    /// - Parameter onDone: A closure to invoke when the barcode has been scanned.
    ///   The parameter in this closure is the value that was scanned.
    func presentScanBarcode(onDone: @escaping (ProductReference) -> Void)
}

protocol DefaultBarcodeScannerPresenterRouter: RouterProtocol, BarcodeScannerPresenterRouter { }

extension DefaultBarcodeScannerPresenterRouter {

    func presentScanBarcode(onDone: @escaping (ProductReference) -> Void) {
        let scene = self.factory.retrieveScene(with: BarcodeScannerRouteDescriptor(onCancel: { controller in
            controller.dismiss(animated: true)
        }, onDone: { controller, reference in
            controller.dismiss(animated: true, completion: {
                onDone(reference)
            })
        }))

        let controller = self.factory.createViewController(scene)
        self.presentModally(controller, detents: [.medium(), .large()], animated: true, completion: nil)
    }
}
