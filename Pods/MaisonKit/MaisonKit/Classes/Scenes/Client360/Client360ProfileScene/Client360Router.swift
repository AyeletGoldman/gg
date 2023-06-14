// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for Client360 screen.
/// Its main responsibility is to allow navigation outside of this screen
public protocol Client360Router: ActionScenePresenterRouter, ActionSheetPresentingRouter, OutreachSelectionPresentingRouter, TemplateSelectionPresentingRouter {

    /// Presents the transaction scene
    /// - Parameter transactionId: the transaction ID to be used to gather the details a transaction
    func presentTransaction(transactionId: String)
}

/// The router for the client lists `Scene`
final class DefaultClient360Router: Router<Client360ViewController>, Client360Router, DefaultActionScenePresenterRouter {

    func presentTransaction(transactionId: String) {
        let scene = self.factory.retrieveScene(with: TransactionDetailsRouteDescriptor(transactionId: transactionId))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
}
