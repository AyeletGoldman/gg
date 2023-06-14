// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class AuthenticationRoutes: NSObject, RouteRegistering {
    /// Registers all authentication routes.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerAuthenticationLandingRoute(onto: registry)
    }
}

/// A set of routes that are provided by the authentication module.
private extension AuthenticationRoutes {
    static func registerAuthenticationLandingRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: AuthenticationRouteDescriptor) in
            return AuthenticationScene(delegate: descriptor.delegate, performLogin: descriptor.performLogin)
        }
    }
}
