// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import UIKit
import StylableSwiftUI

/// A type that has an instance of a `Stylist` available
public protocol Stylable {
    /// A stylist instance with information about the styles for the whole app
    var stylist: Stylist { get set }
}

/// A type that has an instance of `WebStylist` available
public protocol WebContentStylable {

    /// A stylist that can style web content
    var webStylist: WebStylist { get set }
}

/// A type that has an instance of a `UIKitStyleContainer` available
public protocol UIKitStylable {

    /// A container for UIKit with information about the styles for the app that are exposed to UIKit.
    var styleContainer: UIKitStyleContainer { get set }
}

/// A type that given a `Scene` returns a fully configured controller of `Scene.ViewControllerType`.
public struct SceneFactory {

    /// A `Stylist` imlementation to use to style any view controllers created with this `SceneFactory`
    private let stylist: Stylist

    /// A `UIKitStyleContainer` to use to style any view controllers created with this `SceneFactory`
    private let styleContainer: UIKitStyleContainer

    /// A `WebStylist` to use to style any web content that is in a view embedded in any view controllers created with this `SceneFactory`
    private let webStylist: WebStylist

    /// The `SceneRegistry` used to fetch the correct `Scene` for a given segue
    private let registry: SceneRegistry

    /// Creates a new `SceneFactory` with the stylist and registry
    /// - Parameters:
    ///   - stylist: A `Stylist` imlementation to use to style any view controllers created with this `SceneFactory`
    ///   - styleContainer: A `UIKitStyleContainer` to use to style any view controllers created with this `SceneFactory`
    ///   - webStylist: A `WebStylist` to use to style any web content that is in a view embedded in any view controllers created with this `SceneFactory`
    ///   - registry: The `SceneRegistry` used to fetch the correct `Scene` for a given segue
    public init(stylist: Stylist, styleContainer: UIKitStyleContainer, webStylist: WebStylist = .unstyled, registry: SceneRegistry) {
        self.stylist = stylist
        self.registry = registry
        self.styleContainer = styleContainer
        self.webStylist = webStylist
    }

    /// Retrieves a scene with a given descriptor
    /// - Parameter descriptor: a `RouteDescriptor` to use to retreive a scene
    /// - Returns: a fully configured scene given the passed-in descriptor.
    public func retrieveScene(with descriptor: RouteDescriptor) -> some Scene {
        return self.registry.retrieveScene(with: descriptor)
    }

    /// Takes a `Scene` instance, creates its view controller and then calls configure.
    /// - Parameter scene: the scene to use to create and configure the view controller
    /// - Returns: a fully-configured view controller of type `ViewControllerType`.
    public func createViewController<SceneType: Scene>(_ scene: SceneType) -> SceneType.ViewControllerType {

        let controller = scene.createViewController()

        if var stylableController = controller as? Stylable {
            stylableController.stylist = self.stylist
        }

        if var stylableController = controller as? UIKitStylable {
            stylableController.styleContainer = self.styleContainer
        }

        if var stylableController = controller as? WebContentStylable {
            stylableController.webStylist = self.webStylist
        }

        scene.configure(controller: controller, using: self)

        return controller
    }

    func createSearchController(searchResultsController: UIViewController?) -> MKSearchController {
        return MKSearchController(searchResultsController: searchResultsController,
                                  stylist: self.stylist,
                                  styleContainer: self.styleContainer)
    }
}
