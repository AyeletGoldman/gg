// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A type-erased Scene
/// An `AnyScene` allows you to use different `Scene`s without caring about the underlying implementation.
public class AnyScene: Scene {

    private let create: () -> UIViewController
    private let conf: (UIViewController, SceneFactory) -> Void

    /// Creates a new AnyScene with the given Scene
    /// - Parameter scene: The `Scene` to type-erase
    public init<S: Scene>(scene: S) {
        self.create = scene.createViewController
        self.conf = { controller, factory in
            guard let typedController = controller as? S.ViewControllerType else { return }
            scene.configure(controller: typedController, using: factory)
        }
    }

    /// Calls the wrapped configure method for the wrapped `Scene`
    /// - Parameter controller: The controller to configure
    /// - Parameter factory: The factory doing the configuring
    public func configure(controller: UIViewController, using factory: SceneFactory) {
        self.conf(controller, factory)
    }

    /// Returns the view controller that the originally wrapped `Scene` would return
    /// - Returns: A new, unconfigured, instance of the controller this `AnyScene` wraps
    public func createViewController() -> UIViewController {
        return self.create()
    }
}
