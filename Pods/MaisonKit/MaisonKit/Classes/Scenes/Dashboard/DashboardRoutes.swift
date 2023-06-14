// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class DashboardRoutes: NSObject, RouteRegistering {
    /// Registers all dashboard routes.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerDashboardRoute(onto: registry)
        self.registerFiltersRoute(onto: registry)
    }
}

private extension DashboardRoutes {

    private static func registerDashboardRoute(onto registry: SceneRegistry) {
        registry.registerScene { (_: DashboardRouteDescriptor) in
            return DashboardScene()
        }
    }

    private static func registerFiltersRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: DashboardFiltersRouteDescriptor) in
            return FiltersScene(selectedFilters: descriptor.selectedFilters,
                                filters: descriptor.filters,
                                title: descriptor.title,
                                onDismiss: descriptor.onDismiss,
                                doneButtonTitle: descriptor.doneButtonTitle,
                                shouldShowToolbar: descriptor.shouldShowToolbar,
                                onDone: descriptor.onDone)
        }
    }
}
