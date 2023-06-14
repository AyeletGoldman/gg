// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class SelectionListRoutes: NSObject, RouteRegistering {
    /// Registers all routes for selection lists.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerSingleSelectionRoute(onto: registry)
        self.registerMultipleSelectionRoute(onto: registry)
    }
}

/// The routes available in the SelectionList module are registered via this enum.
private extension SelectionListRoutes {

    static func registerSingleSelectionRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: SingleSelectionListRouteDescriptor) in
            return SelectionListScene.singleSelectionListScene(items: descriptor.items,
                                                               selection: descriptor.selection,
                                                               title: descriptor.title,
                                                               onDismiss: descriptor.onDismiss,
                                                               doneButtonTitle: descriptor.doneButtonTitle,
                                                               onDone: descriptor.onDone,
                                                               shouldShowToolbar: descriptor.shouldShowToolbar,
                                                               isRequired: descriptor.isRequired)
        }
    }

    static func registerMultipleSelectionRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: MultipleSelectionListRouteDescriptor) in
            return SelectionListScene.multipleSelectionlistScene(items: descriptor.items,
                                                                 selection: descriptor.selection,
                                                                 title: descriptor.title,
                                                                 onDismiss: descriptor.onDismiss,
                                                                 doneButtonTitle: descriptor.doneButtonTitle,
                                                                 onDone: descriptor.onDone,
                                                                 shouldShowToolbar: descriptor.shouldShowToolbar,
                                                                 isRequired: descriptor.isRequired)
        }
    }
}
