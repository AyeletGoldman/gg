// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Holds a set of registrations that allow the caller to specify which routes correspond to what `Scene`s. This enables
/// teams to override default routes shipped with MaisonKit to present custom scenes.
@objc public final class SceneRegistry: NSObject {
    private var registrations: [RouteDescriptor.Identifier: (RouteDescriptor) -> AnyScene] = [:]

    public override init() {
        super.init()
    }

    /// Registers a given `Scene` for the `RouteDescriptor`.
    /// This method allows teams to override the default registration of scenes provided by MaisonKit.
    /// - Parameter sceneBuilder: A closure that given a specific `RouteDescriptor` will return the corresponding `Scene`.
    public func registerScene<S: Scene, R: RouteDescriptor>(builder sceneBuilder: @escaping (R) -> S?) {
        self.registrations[R.identifier] = { descriptor in
            guard let typedDescriptor = descriptor as? R else {
                return AnyScene(scene: UnimplementedScene())
            }
            guard let scene = sceneBuilder(typedDescriptor) else {
                return AnyScene(scene: UnimplementedScene())
            }
            return AnyScene(scene: scene)
        }
    }

    /// Retrieves a `Scene` given a particular `RouteDescriptor`.
    /// - Parameter descriptor: the descriptor to get the scene for. If a descriptor referenced by the ID of this descriptor has not been registered,
    /// this method will return an `UnimplementedScene`.
    /// - Returns: a fully configured `Scene`.
    public func retrieveScene(with descriptor: RouteDescriptor) -> some Scene {
        guard let closure = self.registrations[type(of: descriptor).identifier] else {
            return AnyScene(scene: UnimplementedScene())
        }
        return closure(descriptor)
    }
}
