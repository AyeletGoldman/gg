// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A protocol to present a curator scene
public protocol CuratorPresenterRouter {

    /// Present the curator scene
    func presentCurator()
}

protocol DefaultCuratorPresenterRouter: RouterProtocol, CuratorPresenterRouter { }

extension DefaultCuratorPresenterRouter {
    func presentCurator() {
        let scene = self.factory.retrieveScene(with: ProductCuratorRouteDescriptor(onClose: { controller in
            controller.dismiss(animated: true, completion: nil)
        }))
        let controller = self.factory.createViewController(scene)
        self.presentFullScreenModally(controller, animated: true, completion: nil)
    }
}
