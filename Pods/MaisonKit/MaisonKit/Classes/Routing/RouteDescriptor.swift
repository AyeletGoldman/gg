// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A descriptor for a route
/// `RouteDescriptor`s are used to allow segues to be overridden dynamically at runtime.
/// The usual process for presenting a screen in MaisonKit is in the following steps:
/// 1. An action is performed that requires a new screen.
/// 2. A router creates a new `RouteDescriptor` for that action and requests the `SceneFactory` return a scene for that `RouteDescriptor`
/// 3. The `SceneFactory` checks the `SceneRegistry` for any scenes registered for the given `RouteDescriptor`. If there is a scene registered for
/// the `RouteDescriptor` provided, it instantiates it and returns it.
/// 4. The router then asks the `SceneFactory` to create a view controller from the `Scene` it now holds.
/// 5. The `SceneFactory` creates and configures the view controller, and then returns it.
/// 6. The router presents the scene.
public protocol RouteDescriptor {
    /// An identifier is a unique string that identifier a route.
    /// Route identifiers are used to decide what scene to present from a given router.
    typealias Identifier = String

    /// The route descriptor's identifier
    static var identifier: Identifier { get }
}
