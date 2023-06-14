// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A protocol to present an action scene
public protocol ActionScenePresenterRouter {

    /// Presents a provided scene
    /// - Parameters:
    ///   - factory: a closure that creates a `RouteDescriptor`
    ///   - preferredPresentationStyle: the preferred style of presentation
    func presentActionScene(factory: @escaping (OnDoneClosure) -> RouteDescriptor,
                            preferredPresentationStyle: PresentationStyle?)
    /// Presents a provided scene
    /// - Parameters:
    ///   - factory: a closure that creates a type-erased `Scene`
    ///   - preferredPresentationStyle: the preferred style of presentation
    func presentActionScene(factory: @escaping (OnDoneClosure) -> AnyScene,
                            preferredPresentationStyle: PresentationStyle?)
}

/// The default implementation for the protocol to present an action scene
public protocol DefaultActionScenePresenterRouter: RouterProtocol, ActionScenePresenterRouter { }

public extension DefaultActionScenePresenterRouter {

    /// Presents a provided scene
    /// - Parameters:
    ///   - factory: a closure that creates a `RouteDescriptor`
    ///   - preferredPresentationStyle: the preferred style of presentation
    func presentActionScene(factory: @escaping (OnDoneClosure) -> RouteDescriptor,
                            preferredPresentationStyle: PresentationStyle?) {
        self.presentScene(sceneFactory: { closure -> AnyScene in
            let routeDescriptor = factory(closure)
            return AnyScene(scene: self.factory.retrieveScene(with: routeDescriptor))
        },
                          preferredPresentationStyle: preferredPresentationStyle)
    }

    /// Presents a provided scene
    /// - Parameters:
    ///   - factory: a closure that creates a type-erased `Scene`
    ///   - preferredPresentationStyle: the preferred style of presentation
    func presentActionScene(factory: @escaping (OnDoneClosure) -> AnyScene,
                            preferredPresentationStyle: PresentationStyle?) {
        self.presentScene(sceneFactory: { factory($0) },
                          preferredPresentationStyle: preferredPresentationStyle)
    }

    private func presentScene<S: Scene>(sceneFactory: (OnDoneClosure) -> S,
                                        preferredPresentationStyle: PresentationStyle?) {

        let modalDismissal: (UIViewController) -> Void = { controller in
            controller.dismiss(animated: true, completion: nil)
        }

        switch preferredPresentationStyle {
        case .modal(let embedInNavigationController, let detents):
            let controller = self.factory.createViewController(sceneFactory(modalDismissal))
            self.presentModally(controller,
                                detents: detents,
                                animated: true,
                                embedInNavigationController: embedInNavigationController,
                                completion: nil)
        case .push, .none:
            let onDone: (UIViewController) -> Void = { controller in
                controller.navigationController?.popViewController(animated: true)
            }
            let controller = self.factory.createViewController(sceneFactory(onDone))
            self.push(controller, animated: true)
        case .fullScreenModal(let embedInNavigationController):
            let controller = self.factory.createViewController(sceneFactory(modalDismissal))
            self.presentFullScreenModally(controller,
                                          animated: true,
                                          embedInNavigationController: embedInNavigationController,
                                          completion: nil)
        }
    }
}
