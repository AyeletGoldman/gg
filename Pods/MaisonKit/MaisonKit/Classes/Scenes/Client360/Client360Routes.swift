// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class Client360Routes: NSObject, RouteRegistering {
    /// Registers all client 360 routes.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerProfileRoute(onto: registry)
        self.registerNotesAndPreferencesRoute(onto: registry)
        self.registerDetailsRoute(onto: registry)
        self.registerTransactionDetails(onto: registry)
        self.registerActionSheetRoute(onto: registry)
        self.registerEditClientRoute(onto: registry)
        self.registerTimelineClientEventRoute(onto: registry)
        self.registerEditClientConfirmationRoute(onto: registry)
    }
}

/// Defines the routes available for the Client360 module
private extension Client360Routes {

    static func registerProfileRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: Client360RouteDescriptor) in
            return Client360Scene(clientId: descriptor.clientId,
                                  clientName: descriptor.clientName,
                                  onClose: descriptor.onClose)
        }
    }

    static func registerNotesAndPreferencesRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: Client360NotesAndPreferencesRouteDescriptor) in
            return Client360NotesAndPreferencesScene(clientId: descriptor.clientId)
        }
    }

    static func registerDetailsRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: Client360DetailsRouteDescriptor) in
            return Client360DetailsScene(clientName: descriptor.clientName, clientId: descriptor.clientId)
        }
    }

    static func registerTransactionDetails(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: TransactionDetailsRouteDescriptor) in
            return TransactionDetailsScene(transactionId: descriptor.transactionId,
                                           onClose: descriptor.onClose)
        }
    }

    static func registerActionSheetRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ActionSheetRouteDescriptor) in
            return ActionSheetScene(actionSheetContent: descriptor.actionSheetContent,
                                    onCancel: descriptor.onCancel,
                                    onSelect: descriptor.onItemSelected)
        }
    }

    static func registerEditClientRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: EditClientRouteDescriptor) in
            return EditClientScene(clientID: descriptor.clientID,
                                   onCancel: descriptor.onCancel,
                                   onSuccess: descriptor.onSuccess)
        }
    }

    static func registerTimelineClientEventRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: TimelineClientEventRouteDescriptor) in
            return TimelineClientEventScene(mode: descriptor.mode,
                                            eventType: descriptor.eventType,
                                            onDismiss: descriptor.onDismiss)
        }
    }

    static func registerEditClientConfirmationRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: EditClientConfirmationRouteDescriptor) in
            return EditClientConfirmationScene(clientID: descriptor.clientID,
                                               data: descriptor.data,
                                               onSuccess: descriptor.onSuccess)
        }
    }
}
