// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A protocol that a class in each module that wants a chance to register routes
/// should conform to. This opportunity happens as part of the initialization of MaisonKit, via `MaisonKit.initialize(_:)`
@objc protocol RouteRegistering {
    static func registerRoutes(onto registry: SceneRegistry)
}
