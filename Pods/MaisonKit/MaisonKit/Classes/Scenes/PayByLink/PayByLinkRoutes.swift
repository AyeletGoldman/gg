// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class PayByLinkRoutes: NSObject, RouteRegistering {
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerCreateOrderRoute(onto: registry)
        self.registerDeliveryCreateOrderRoute(onto: registry)
        self.registerConfirmOrderRoute(onto: registry)
        self.registerCopyPayByLink(onto: registry)
        self.registerPresentPermissionsAlert(onto: registry)
        self.registerAttributeSelection(onto: registry)
    }
}

/// Defines the routes available for the PayByLink module
private extension PayByLinkRoutes {

    static func registerCreateOrderRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: PBLCreateOrderDescriptor) in
            return PBLCreateOrderScene(data: descriptor.data, title: descriptor.title, onClose: descriptor.onClose)
        }
    }

    static func registerDeliveryCreateOrderRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: DeliveryCreateOrderRouteDescriptor) in
            return SelectionListScene.singleSelectionListScene(items: descriptor.availableDeliveryMethods,
                                                               selection: descriptor.selectedDeliveryMethodId,
                                                               title: descriptor.title,
                                                               onDismiss: descriptor.onClose,
                                                               doneButtonTitle: descriptor.doneButtonTitle,
                                                               onDone: descriptor.onDone)
        }
    }

    static func registerConfirmOrderRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: PBLConfirmOrderRouteDescriptor) in
            return PBLConfirmOrderScene(orderId: descriptor.orderId,
                                        onClose: descriptor.onClose,
                                        onShareCompletion: descriptor.onShareCompletion)
        }
    }

    static func registerCopyPayByLink(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: PBLCopyLinkRouteDescriptor) in
            return PBLCopyLinkScene(orderId: descriptor.orderId, onDone: descriptor.onDone)
        }
    }

    static func registerPresentPermissionsAlert(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: NotificationsPermissionsRouteDescriptor) in
            return NotificationsPermissionsScene(onDone: descriptor.onDone)
        }
    }

    static func registerAttributeSelection(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: PBLAttributeSelectionRouteDescriptor) in
            return PBLAttributeSelectionScene(productMasterID: descriptor.productMasterID,
                                              initialSelectedAttributes: descriptor.initiallySelectedAttributes,
                                              onDone: descriptor.onDone,
                                              onCancel: descriptor.onCancel)
        }
    }
}
