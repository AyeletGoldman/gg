// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A router protocol that presents outreach selection modals
/// By default, this router will present the action sheets from the custom `ActionSheetRouteDescriptor`
public protocol OutreachSelectionPresentingRouter: RouterProtocol {

    /// Presents the oureach selection modal
    /// - Parameters:
    ///   - getOutreachActions: a closure that will return the publisher used to listen to for outreach actions
    ///   - onItemSelected: a closure to invoke when an outreach item has been selected
    /// - Note: The default implementation presents the `OutreachSelectionRouteDescriptor`'s scene modally.
    func presentOutreachSelection(getOutreachActions: @escaping GetOutreachActionsMethod,
                                  onItemSelected: @escaping (OutreachType, String?) -> Void)
}

public extension OutreachSelectionPresentingRouter {
    // Default implementation. Presents the `OutreachSelectionRouteDescriptor`'s scene modally.
    func presentOutreachSelection(getOutreachActions: @escaping GetOutreachActionsMethod,
                                  onItemSelected: @escaping (OutreachType, String?) -> Void) {

        let descriptor = OutreachSelectionRouteDescriptor(getOutreachActions: getOutreachActions,
                                                          onCancel: { controller in
            controller.dismiss(animated: true)
        },
                                                          onItemSelected: { type, recipient, controller in
            controller.dismiss(animated: true) {
                onItemSelected(type, recipient)
            }
        })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller, detents: [.medium(), .large()], animated: true, completion: nil)
    }
}
