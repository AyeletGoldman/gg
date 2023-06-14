// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for the client lists `Scene`
public protocol ClientListsRouter: ActionScenePresenterRouter {
    /// Pushes the view controller for the client lists members given a particular list ID onto the navigation stack
    /// - Parameters:
    ///   - listId: the client list ID
    ///   - listType: a list type. This is a human readable component usually used for analytics and reporting. An example value of this would be "personal" or "featured".
    func presentMemberList(listId: String, listType: String)

    /// Presents a screen to create a new client list
    func presentCreateNewList()

    /// Present the client creation scene
    func presentCreateClient()
}

/// Default implementation of the `ClientListsRouter`
final class DefaultClientListsRouter: Router<ClientListsViewController>, ClientListsRouter, DefaultActionScenePresenterRouter {

    func presentMemberList(listId: String, listType: String) {
        let scene = self.factory.retrieveScene(with: MemberListRouteDescriptor(listId: listId, listType: listType, onDeleted: { controller in
            controller.navigationController?.popViewController(animated: true)
        }))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    func presentCreateNewList() {
        let scene = self.factory.retrieveScene(with: CreateClientListsRouteDescriptor(onDone: { controller in
            controller.dismiss(animated: true, completion: nil)
        }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }

    func presentCreateClient() {
        let scene = self.factory.retrieveScene(with: CreateClientRouteDescriptor(onDismiss: { controller in
            controller.dismiss(animated: true, completion: nil)
        }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
