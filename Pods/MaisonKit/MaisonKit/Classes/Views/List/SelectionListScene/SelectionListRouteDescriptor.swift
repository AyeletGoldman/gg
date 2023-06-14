// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor used for the presentation of the single selection list scene
public struct SingleSelectionListRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "SingleSelectionListRouteDescriptor"

    /// The items in the selection list.
    public let items: [SelectionListItem]
    /// Optional. The default selection ID.
    public let selection: String?
    /// The title of the scene. Usually shown in the navigation bar.
    public let title: String
    /// Optional. A closure to invoke when the user wants to dismiss the presented scene.
    public let onDismiss: ((UIViewController) -> Void)?
    /// The title of the done button.
    public let doneButtonTitle: String
    /// A closure to invoke when the user wants to save the new selection.
    public let onDone: (UIViewController, String?) -> Void
    /// Whether to show a bottom toolbar with a clear button or not.
    public let shouldShowToolbar: Bool
    /// Whether the selection is required or not.
    public let isRequired: Bool

    /// Creates a new `SingleSelectionListRouteDescriptor`
    /// - Parameters:
    ///   - items: The items in the selection list.
    ///   - selection: Optional. The default selection ID.
    ///   - title: The title of the scene. Usually shown in the navigation bar.
    ///   - onDismiss: Optional. A closure to invoke when the user wants to dismiss the presented scene.
    ///   - doneButtonTitle: The title of the done button.
    ///   - onDone: A closure to invoke when the user wants to save the new selection.
    ///   - shouldShowToolbar: Whether to show a bottom toolbar with a clear button or not.
    ///   - isRequired: Whether the selection is required or not.
    public init(items: [SelectionListItem],
                selection: String?,
                title: String,
                onDismiss: ((UIViewController) -> Void)? = nil,
                doneButtonTitle: String,
                onDone: @escaping (UIViewController, String?) -> Void,
                shouldShowToolbar: Bool = false,
                isRequired: Bool = false) {
        self.items = items
        self.selection = selection
        self.title = title
        self.onDismiss = onDismiss
        self.doneButtonTitle = doneButtonTitle
        self.onDone = onDone
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
    }
}

/// The route descriptor used for the presentation of the multiple selection list scene
public struct MultipleSelectionListRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "MultipleSelectionListRouteDescriptor"

    /// The items in the selection list.
    public let items: [SelectionListItem]
    /// Optional. The default selection IDs.
    public let selection: Set<String>
    /// The title of the scene. Usually shown in the navigation bar.
    public let title: String
    /// Optional. A closure to invoke when the user wants to dismiss the presented scene.
    public let onDismiss: ((UIViewController) -> Void)?
    /// The title of the done button.
    public let doneButtonTitle: String
    /// A closure to invoke when the user wants to save the new selection.
    public let onDone: (UIViewController, Set<String>) -> Void
    /// Whether to show a bottom toolbar with a clear button or not.
    public let shouldShowToolbar: Bool
    /// Whether the selection is required or not.
    public let isRequired: Bool

    /// Creates a new `MultipleSelectionListRouteDescriptor` for multiple selection.
    /// - Parameters:
    ///   - items: The items in the selection list.
    ///   - selection: Optional. The default selection IDs.
    ///   - title: The title of the scene. Usually shown in the navigation bar.
    ///   - onDismiss: Optional. A closure to invoke when the user wants to dismiss the presented scene.
    ///   - doneButtonTitle: The title of the done button.
    ///   - onDone: A closure to invoke when the user wants to save the new selection.
    ///   - shouldShowToolbar: Whether to show a bottom toolbar with a clear button or not.
    ///   - isRequired: Whether the selection is required or not.
    public init(items: [SelectionListItem],
                selection: Set<String> = [],
                title: String,
                onDismiss: ((UIViewController) -> Void)? = nil,
                doneButtonTitle: String,
                onDone: @escaping (UIViewController, Set<String>) -> Void,
                shouldShowToolbar: Bool = false,
                isRequired: Bool = false) {
        self.items = items
        self.selection = selection
        self.title = title
        self.onDismiss = onDismiss
        self.doneButtonTitle = doneButtonTitle
        self.onDone = onDone
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
    }
}
