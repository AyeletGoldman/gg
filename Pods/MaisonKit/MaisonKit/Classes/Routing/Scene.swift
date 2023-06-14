// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A `Scene` is a type used to create and configure a view controller
public protocol Scene {

    /// A `Scene` wraps a single view controller type. It can make others internally, but when used by a `SceneFactory`
    /// this is the controller type returned.
    associatedtype ViewControllerType: UIViewController

    /// Implement this to return a new instance of the view controller representing this scene.
    ///
    /// - note: If the view controller type implements `StoryboardInstantiable` then this method is automatically
    /// implemented to return the controller from a storyboard named the same as this Scene type.
    ///
    /// - Returns: A new, unconfigured, instance of this `Scene`'s controller type
    func createViewController() -> ViewControllerType

    /// Implement this to configure your view controller i.e. set it's view model if it's MVVM etc.
    ///
    /// - Parameter controller: The controller to configure
    /// - Parameter factory: The factory doing the configuring
    func configure(controller: ViewControllerType, using factory: SceneFactory)
}
