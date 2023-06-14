// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// A protocol that describes an object that can handle inbound items like push notifications and nsuseractivities
public protocol InboundItemRegistration {

    /// Requests the object handle the inbound item.
    /// If it is able to handle it, it will return a `AnyScene`. If it is not able to handle it, it will return `nil`.
    /// - Parameters:
    ///   - identifier: the identifier of the given inbound item
    ///   - data: a set of data that the registration can use to identify if it can hande the item or not.
    ///   - onDone: A closure to invoke when the scene that has been returned has finished doing any work it required.
    /// - Returns: A type-erased scene, if the app is expected to present a new from this registration
    func handleInboundItem(identifier: InboundItemIdentifier, data: [String: Any], onDone: @escaping (UIViewController) -> Void) -> RouteDescriptor?
}

/// A class to handle inbound links or items arriving to the app.
/// Examples of this are push notifications, NSUserActivity
public final class InboundItemHandler {

    private enum Labels {
        static let closeButtonTitle = MKLocalizedString("notifications.window.close-button.title",
                                                        comment: "The title of the close button in views that are presented after a navigation view")
    }

    private var registrations: [InboundItemRegistration] = []
    private var sceneFactory: SceneFactory?
    private weak var windowScene: UIWindowScene?
    private var overlayWindow: UIWindow?
    private var stylist: Stylist?

    /// The default instance of an InboundHandler
    public static let `default` = InboundItemHandler()

    init() { }

    /// Configures the NotificationHandler with the given window scene, scene factory and stylist.
    /// - Parameters:
    ///   - windowScene: a window scene to use to create the window that will present the notification scenes
    ///   - sceneFactory: the factory to use to create view controllers
    ///   - stylist: a stylist to use to style the close button
    public func configure(withWindowScene windowScene: UIWindowScene,
                          sceneFactory: SceneFactory,
                          stylist: Stylist) {
        self.windowScene = windowScene
        self.sceneFactory = sceneFactory
        self.stylist = stylist
    }

    /// Attempts to handle an inbound item by asking all registrations if they can handle it.
    /// Returns `true` upon finding a registration that can handle the given inbound item.
    /// - Parameters:
    ///   - identifier: the identifier for the item
    ///   - data: some data that is associated with the item
    /// - Returns: `true` if the item has been handled, `false` otherwise
    @discardableResult public func handleInboundItem(identifier: InboundItemIdentifier, data: [String: Any]) -> Bool {
        guard let windowScene = self.windowScene else { return false }
        let onDone: (UIViewController) -> Void = { [weak self] controller in
            controller.dismiss(animated: true, completion: {
                self?.overlayWindow = nil
            })
        }
        for registration in self.registrations {
            guard let descriptor = registration.handleInboundItem(identifier: identifier, data: data, onDone: onDone),
                  let scene = self.sceneFactory?.retrieveScene(with: descriptor),
                  let controller = self.buildDestinationViewController(fromScene: scene) else {
                continue
            }
            self.overlayWindow = UIWindow(windowScene: windowScene)
            self.overlayWindow?.overlayNewController(controller)
            return true
        }
        return false
    }

    private func buildDestinationViewController<S: Scene>(fromScene scene: S) -> UIViewController? {
        return self.sceneFactory?.createViewController(scene)
    }

    /// Registers a new notification listener.
    ///
    /// When a listener is registered, and a new notification arrives, the registered listeners are
    /// asked to provide a scene, in order. When a scene is found, it is presented.
    /// - Parameter registration: a new listener to register that might be able to handle notifications.
    public func register(_ registration: InboundItemRegistration) {
        self.registrations.append(registration)
    }
}
