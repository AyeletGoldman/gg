// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the editable client list screen. This is typically used when we want a screen that allows us to search
/// for clients but also select them. For example, when you are editing a client list to add or remove clients.
public struct SearchEditableClientListRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "SearchEditableClientListRouteDescriptor"

    /// The set of initially-selected client IDs
    public let initialSelectedClientIds: Set<String>

    /// A closure to invoke when the user has finished editing the client list, with a new set of selected clients
    public let onDone: (UIViewController, Set<String>) -> Void

    /// A title for this scene, usually used to display on the navigation bar
    public let title: String?

    /// A closure to invoke when the user cancels the editing of the searching/editing of the client list
    public let onDismiss: (UIViewController) -> Void

    /// Whether or not we should show the search bar
    public let shouldShowSearchBar: Bool

    /// Creates a new `SearchEditableClientListRouteDescriptor`
    /// - Parameters:
    ///   - initialSelectedClientIds: The set of initially-selected client IDs
    ///   - title: A title for this scene, usually used to display on the navigation bar
    ///   - shouldShowSearchBar: Whether or not we should show the search bar. Defaults to `true`.
    ///   - onDismiss: A closure to invoke when the user cancels the editing of the searching/editing of the client list
    ///   - onDone: A closure to invoke when the user has finished editing the client list, with a new set of selected clients
    public init(initialSelectedClientIds: Set<String>,
                title: String?,
                shouldShowSearchBar: Bool = true,
                onDismiss: @escaping (UIViewController) -> Void,
                onDone: @escaping (UIViewController, Set<String>) -> Void) {
        self.initialSelectedClientIds = initialSelectedClientIds
        self.onDone = onDone
        self.shouldShowSearchBar = shouldShowSearchBar
        self.title = title
        self.onDismiss = onDismiss
    }

}

/// The route descriptor for searching a client list
public struct SearchClientListRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "SearchClientListRouteDescriptor"

    /// The list ID to search in
    public let listId: ListID

    /// A title for this scene, usually used to display on the navigation bar
    public let title: String?

    /// Creates a new `SearchClientListRouteDescriptor`
    /// - Parameters:
    ///   - listId: The list ID to search in
    ///   - title: A title for this scene, usually used to display on the navigation bar
    public init(listId: ListID, title: String?) {
        self.listId = listId
        self.title = title
    }
}

/// The route descriptor for searching a global client list
public struct GlobalClientSearchRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "GlobalClientSearchRouteDescriptor"

    /// A title for this scene, usually used to display on the navigation bar
    public let title: String?

    /// Creates a new `GlobalClientSearchRouteDescriptor`
    /// - Parameters:
    ///   - title: A title for this scene, usually used to display on the navigation bar
    public init(title: String?) {
        self.title = title
    }
}
