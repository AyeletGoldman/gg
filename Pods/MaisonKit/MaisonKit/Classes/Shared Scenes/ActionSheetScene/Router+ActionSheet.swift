// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A router protocol that presents action sheets.
/// By default, this router will present the action sheets from the custom `ActionSheetRouteDescriptor`
public protocol ActionSheetPresentingRouter: RouterProtocol {

    /// Presents the action sheet scene
    /// - Parameters:
    ///   - content: The content to show in when the sheet is presented
    ///   - onItemSelected: A closure to invoke when an item is selected. The parameter in the closure is the selected action sheet item.
    ///   Callers of this function should use the closure's `ActionSheetItem` parameter's `action` property to perform the action associated with the item.
    func presentActionSheet(_ content: ActionSheetContent,
                            onItemSelected: @escaping (ActionSheetItem) -> Void)
}

extension ActionSheetPresentingRouter {
    func presentActionSheet(_ content: ActionSheetContent,
                            onItemSelected: @escaping (ActionSheetItem) -> Void) {

        let descriptor = ActionSheetRouteDescriptor(actionSheetContent: content,
                                                    onCancel: { controller in
            controller.dismiss(animated: true)
        },
                                                    onItemSelected: { controller, item in
            controller.dismiss(animated: true) {
                onItemSelected(item)
            }
        })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller, detents: [.medium(), .large()], animated: true, completion: nil)
    }
}
