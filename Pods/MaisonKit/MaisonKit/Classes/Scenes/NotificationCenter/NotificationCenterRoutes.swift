// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class NotificationCenterRoutes: NSObject, RouteRegistering {
    /// Registers all routes available to the NotificationCenter module.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerNotificationCenter(onto: registry)
    }
}

/// The routes available in the NotificationCenter module are registered via this enum.
private extension NotificationCenterRoutes {

    static func registerNotificationCenter(onto registry: SceneRegistry) {
        registry.registerScene { (_: NotificationCenterRouteDescriptor) in
            return NotificationCenterScene()
        }
    }
}
