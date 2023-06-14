// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for the ClientListFormViewController
/// This screen can only present the client list search to select/unselect a number of clients to be added or removed from a client list.
public protocol ClientListFormRouter {
    /// Presents the view controller created from the scene returned by the `searchClientListScene` scene registry.
    /// - Parameters:
    ///   - initialSelectedClientIds: a set of initially-selected client IDs
    ///   - onSelectedClients: a closure to invoke with the newly-selected clients
    func presentClientSearch(initialSelectedClientIds: Set<String>,
                             onSelectedClients: @escaping (Set<String>) -> Void)
}

/// Default implementation of the `ClientListFormRouter`
final class DefaultClientListFormRouter: Router<ClientListFormViewController>, ClientListFormRouter {

    private enum Labels {
        static let selectClientsTitle = MKLocalizedString("clients.search.form.navigationBar.title",
                                                          comment: "Title for the client search navigation bar when accessed from the client list form"
)
    }

    func presentClientSearch(initialSelectedClientIds: Set<String>,
                             onSelectedClients: @escaping (Set<String>) -> Void) {
        let scene = self.factory.retrieveScene(with: SearchEditableClientListRouteDescriptor(initialSelectedClientIds: initialSelectedClientIds,
                                                                                             title: Labels.selectClientsTitle,
                                                                                             onDismiss: { controller in
                                                                                                controller.dismiss(animated: true, completion: nil)
                                                                                             }, onDone: { controller, selectedClients in
                                                                                                onSelectedClients(selectedClients)
                                                                                                controller.dismiss(animated: true, completion: nil)
                                                                                             }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
