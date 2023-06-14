// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class NPSRoutes: NSObject, RouteRegistering {
    /// Registers all NPS routes.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerNPSDetails(onto: registry)
        self.registerSurveyDetails(onto: registry)
    }
}

/// Conveniece to register all routes required for NPS.
private extension NPSRoutes {
    static func registerNPSDetails(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: NPSDetailsRouteDescriptor) in
            return NPSDetailsScene(id: descriptor.id)
        }
    }

    static func registerSurveyDetails(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: NPSSurveyDetailsRouteDescriptor) in
            return NPSSurveyDetailsScene(id: descriptor.id)
        }
    }
}
