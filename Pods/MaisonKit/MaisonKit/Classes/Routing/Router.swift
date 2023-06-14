// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import UIKit

/// The base class for all routers.
/// Routers in our `Scene` architecture take care of presenting and dismissing other controllers
open class Router<ViewController: UIViewController>: RouterProtocol {

    /// The view controller this router is associated with.
    public private(set) weak var controller: ViewController?

    /// The scene factory used to create other view controllers to be presented
    public let factory: SceneFactory

    /// Creates a new Router.
    /// - Parameters:
    ///   - controller: The view controller this router is associated with.
    ///   - factory: The scene factory used to create other view controllers to be presented
    public init(controller: ViewController, factory: SceneFactory) {
        self.controller = controller
        self.factory = factory
    }

    public func push(_ controllerToPush: UIViewController, animated: Bool = true) {
        if let navController = self.controller?.navigationController {
            navController.pushViewController(controllerToPush, animated: animated)
        } else {
            // Usually will be in use in case of pushing via a search controller.
            self.controller?.presentingViewController?.navigationController?.pushViewController(controllerToPush, animated: animated)
        }
    }

    public func presentModally(_ controllerToPresent: UIViewController,
                               detents: [UISheetPresentationController.Detent]? = nil,
                               animated: Bool = true,
                               embedInNavigationController: Bool = true,
                               completion: (() -> Void)? = nil) {
        let controller: UIViewController = embedInNavigationController ? StylableNavigationController(rootViewController: controllerToPresent) : controllerToPresent
        controller.sheetPresentationController?.detents = detents ?? [.large()]
        controller.sheetPresentationController?.prefersGrabberVisible = detents != nil
        self.controller?.present(controller, animated: animated, completion: completion)
    }

    public func presentFullScreenModally(_ controllerToPresent: UIViewController,
                                         animated: Bool = true,
                                         embedInNavigationController: Bool = true,
                                         completion: (() -> Void)? = nil) {
        let controller: UIViewController = embedInNavigationController ? StylableNavigationController(rootViewController: controllerToPresent) : controllerToPresent
        controller.modalPresentationStyle = .fullScreen
        self.controller?.present(controller, animated: animated, completion: completion)
    }
}

/// A protocol to define a router
public protocol RouterProtocol {

    /// The scene factory used to create other view controllers to be presented
    var factory: SceneFactory { get }

    /// Pushes a new controller onto the navigation stack
    /// - Parameters:
    ///   - controllerToPush: the new controller to push onto the stack
    ///   - animated: whether the pushing is animated or not
    func push(_ controllerToPush: UIViewController, animated: Bool)

    /// Presents a new controller on top of the current navigation stack
    /// - Parameters:
    ///   - controllerToPresent: the controller to present
    ///   - detents: the available detents for the sheet to be presented; use `.medium()` to allow half-modal presentation
    ///   - animated: whether the presentation is animated or not
    ///   - embedInNavigationController: whether the given controller should be embedded in a `StylableNavigationController`
    ///   - completion: a closure to invoke when presentation has completed
    func presentModally(_ controllerToPresent: UIViewController,
                        detents: [UISheetPresentationController.Detent]?,
                        animated: Bool,
                        embedInNavigationController: Bool,
                        completion: (() -> Void)?)

    /// Presents a new controller on top of the current navigation stack in full-screen mode
    /// - Parameters:
    ///   - controllerToPresent: the controller to present
    ///   - animated: whether the presentation is animated or not
    ///   - embedInNavigationController: whether the given controller should be embedded in a `StylableNavigationController`
    ///   - completion: a closure to invoke when presentation has completed
    func presentFullScreenModally(_ controllerToPresent: UIViewController,
                                  animated: Bool,
                                  embedInNavigationController: Bool,
                                  completion: (() -> Void)?)
}

public extension RouterProtocol {
    /// Presents a new controller on top of the current navigation stack
    /// - Parameters:
    ///   - controllerToPresent: the controller to present
    ///   - detents: the available detents for the sheet to be presented; use `.medium()` to allow half-modal presentation
    ///   - animated: whether the presentation is animated or not
    ///   - embedInNavigationController: whether the given controller should be embedded in a `StylableNavigationController`
    ///   - completion: a closure to invoke when presentation has completed
    func presentModally(_ controllerToPresent: UIViewController,
                        detents: [UISheetPresentationController.Detent]? = nil,
                        animated: Bool,
                        embedInNavigationController: Bool = true,
                        completion: (() -> Void)?) {
        self.presentModally(controllerToPresent,
                            detents: detents,
                            animated: animated,
                            embedInNavigationController: embedInNavigationController,
                            completion: completion)
    }

    /// Presents a new controller on top of the current navigation stack in full-screen mode and embeds the given controller in a `StylableNavigationController`
    /// - Parameters:
    ///   - controllerToPresent: the controller to present
    ///   - animated: whether the presentation is animated or not
    ///   - completion: a closure to invoke when presentation has completed
    func presentFullScreenModally(_ controllerToPresent: UIViewController,
                                  animated: Bool,
                                  completion: (() -> Void)?) {
        self.presentFullScreenModally(controllerToPresent,
                                      animated: animated,
                                      embedInNavigationController: true,
                                      completion: completion)
    }
}
