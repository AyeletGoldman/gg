// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for Client360Details screen.
/// Its main responsibility is to allow navigation outside of this screen
public protocol Client360DetailsRouter: GenericFormRouter {

    /// Asks the router to present the edit client screen
    /// - Parameters:
    ///   - clientID: The client ID that is to be edited
    ///   - onSuccess: a closure to invoke when the editing has been successful
    func presentEditClient(clientID: String, onSuccess: () -> Void)
}

/// The default router for Client360Details screen.
final class DefaultClient360DetailsRouter: Router<Client360DetailsViewController>, Client360DetailsRouter, DefaultGenericFormPresenterRouter {
    func presentEditClient(clientID: String, onSuccess: () -> Void) {
        let descriptor = EditClientRouteDescriptor(clientID: clientID,
                                                   onCancel: { controller in
            controller.dismiss(animated: true)
        }, onSuccess: { controller in
            controller.dismiss(animated: true)
        })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller, animated: true, completion: nil)
    }
}
