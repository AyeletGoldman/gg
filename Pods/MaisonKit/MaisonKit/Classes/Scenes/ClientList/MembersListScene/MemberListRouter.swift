// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for the member list `Scene`
public protocol MemberListRouter: ActionScenePresenterRouter {

    /// Presents the edit flow for the current member list
    /// - Parameters:
    ///   - listId: the list ID to present the edit flow for
    ///   - listName: the list name to present the edit flow for
    ///   - onDone: a closure to invoke when the list is closed. Received a boolean indicating whether the editing was closed because the user is deleting the list.
    ///     `true` if the list is being deleted, `false` otherwise.
    func presentEditList(listId: String, listName: String, onDone: @escaping (Bool) -> Void)

    /// Pushes the client360 scene onto the navigation stack
    /// - Parameter clientId: the client ID to present the details for
    /// - Parameter clientName: _optional_. The name of the client we're presenting details for, if available
    func presentClient360(clientId: String, clientName: String?)

    /// Presents the member list sort scene.
    /// - Parameters:
    ///   - sortItems: the set of sort items that should be displayed
    ///   - initialSortValue: an initial sort value that should be selected by default
    ///   - onDone: a closure to invoke when the selection has been completed.
    func presentMemberListSort(sortItems: [SortItem],
                               initialSortValue: String?,
                               onDone: @escaping (String?) -> Void)
}

/// The default implementation of the `MemberListRouter`
final class DefaultMemberListRouter: Router<MemberListViewController>, MemberListRouter, DefaultActionScenePresenterRouter {

    private enum Labels {
        static let sortTitle = MKLocalizedString("client-list.toolbar.sort.title",
                                                 comment: "The text to show for the sort button in client lists")
        static let sortDoneTitle = MKLocalizedString("client-list.sort.done.title",
                                                 comment: "The text to show for the sort done button in client lists")
    }

    func presentEditList(listId: String,
                         listName: String,
                         onDone: @escaping (Bool) -> Void) {
        let scene = self.factory.retrieveScene(with: EditClientListsRouteDescriptor(listId: listId,
                                                                                             listName: listName,
                                                                                             onDone: { controller, isBeingDeleted in
                                                                                                controller.dismiss(animated: true, completion: {
                                                                                                    onDone(isBeingDeleted)
                                                                                                })
                                                                                             }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }

    /// Pushes the client360 scene onto the navigation stack
    /// - Parameter clientId: the client ID to present the details for
    /// - Parameter clientName: _optional_. The name of the client we're presenting details for, if available
    func presentClient360(clientId: String, clientName: String?) {
        let scene = self.factory.retrieveScene(with: Client360RouteDescriptor(clientID: clientId, clientName: clientName))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    /// Presents the member list sort scene.
    /// - Parameters:
    ///   - sortItems: the set of sort items that should be displayed
    ///   - initialSortValue: an initial sort value that should be selected by default
    ///   - onDone: a closure to invoke when the selection has been completed.
    func presentMemberListSort(sortItems: [SortItem],
                               initialSortValue: String?,
                               onDone: @escaping (String?) -> Void) {
        let scene = self.factory.retrieveScene(with: SortMemberListRouteDescriptor(sortItems: sortItems,
                                                                                   initialSortValue: initialSortValue,
                                                                                   title: Labels.sortTitle,
                                                                                   doneButtonTitle: Labels.sortDoneTitle,
                                                                                   onDone: { controllerToDismiss, criteria in
                                                                                    onDone(criteria)
                                                                                    controllerToDismiss.dismiss(animated: true, completion: nil)
                                                                                   },
                                                                                   onClose: { controllerToDismiss in
                                                                                    controllerToDismiss.dismiss(animated: true, completion: nil)
                                                                                   }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
