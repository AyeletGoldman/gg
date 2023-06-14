// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for the client search `Scene`
public protocol SearchClientsRouter: ActionScenePresenterRouter {

    /// Presents a scene of client details
    /// - Parameter clientId: The ID of the client whose details we will fetch and display
    func presentClientDetails(clientId: String)

    /// Present the client creation scene
    func presentCreateClient()
}

final class DefaultSearchClientsRouter: Router<SearchClientsViewController>, SearchClientsRouter, DefaultActionScenePresenterRouter {
    func presentClientDetails(clientId: String) {
        let scene = self.factory.retrieveScene(with: Client360RouteDescriptor(clientID: clientId, clientName: nil))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    func presentCreateClient() {
        let scene = self.factory.retrieveScene(with: CreateClientRouteDescriptor(onDismiss: { controller in
            controller.dismiss(animated: true, completion: nil)
        }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
