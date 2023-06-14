//  Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for pay by link information
public protocol PBLConfirmOrderRouter: OutreachSelectionPresentingRouter, TemplateSelectionPresentingRouter {
    /// Presents the pay by link copying scene
    /// - Parameters:
    ///   - orderId: the order ID to use to get the details of this pay-by-link
    func presentCopyPayByLink(orderId: String)

    /// Presents the notification permissions modal
    /// - Parameter onDone: a closure invoked when the modal has finished its work. Receives one parameter (a boolean) indicating whether the user canceled the flow.
    func presentNotificationPermissions(onDone: @escaping (_ canceled: Bool) -> Void)
}

final class DefaultPBLConfirmOrderRouter: Router<PBLConfirmOrderViewController>, PBLConfirmOrderRouter {
    func presentCopyPayByLink(orderId: String) {
        let scene = self.factory.retrieveScene(with: PBLCopyLinkRouteDescriptor(orderId: orderId, onDone: { controller in
            controller.dismiss(animated: true, completion: nil)
        }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }

    func presentNotificationPermissions(onDone: @escaping (_ canceled: Bool) -> Void) {
        let descriptor = NotificationsPermissionsRouteDescriptor(onDone: { controller, didCancel in
            controller.dismiss(animated: true) {
                onDone(didCancel)
            }
        })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
