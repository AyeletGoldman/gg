// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the editing of client lists flow.
public struct EditClientListsRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "EditClientListsRouteDescriptor"

    /// The list ID to be edited
    public let listId: String
    /// The list name to be edited
    public let listName: String
    /// A closure to invoke when the user has finished editing the list
    /// Takes a view controller (the edit list view controller) and a boolean indicating whether the controller was closed because of
    /// the list being deleted or not. `true` if the list is being deleted, `false` otherwise
    public let onDone: (UIViewController, Bool) -> Void

    /// Creates a new `EditClientListsRouteDescriptor`
    /// - Parameters:
    ///   - listId: The list ID to be edited
    ///   - listName: The list name to be edited
    ///   - onDone: A closure to invoke when the user has finished editing the list
    ///     Takes a view controller (the edit list view controller) and a boolean indicating whether the controller was closed because of
    ///     the list being deleted or not. `true` if the list is being deleted, `false` otherwise
    public init(listId: String, listName: String, onDone: @escaping (UIViewController, Bool) -> Void) {
        self.listId = listId
        self.listName = listName
        self.onDone = onDone
    }
}
