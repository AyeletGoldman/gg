// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public struct ProductSortRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ProductSortRouteDescriptor"

    /// The initial sort value to be selected, if any. This ID must match the ID of one of the `SortItem`s in the `availableSortCriteria` property.
    public let selectedSort: String?
    /// The list of available sort items
    public let availableSortCriteria: [SortItem]
    /// The title of the scene. Usually shown in the navigation bar.
    public let title: String
    /// The title of the done button
    public let doneButtonTitle: String
    /// Whether to show the toolbar at the bottom of the view
    public let shouldShowToolbar: Bool
    /// A closure to invoke with the newly selected filters when the user has finished filtering.
    public let onDismiss: (UIViewController) -> Void
    /// A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    public let onDone: (UIViewController, String?) -> Void

    /// Creates a new `ProductSortRouteDescriptor`
    /// - Parameters:
    ///   - selectedSort: _optional_ The initial sort value to be selected, if any. This ID must match the ID of one of the `SortItem`s in the `availableSortCriteria` property.
    ///   - availableSortCriteria: The list of available sort items
    ///   - title: The title of the scene. Usually shown in the navigation bar.
    ///   - doneButtonTitle: The title of the done button
    ///   - shouldShowToolbar: Whether to show the toolbar at the bottom of the view
    ///   - onDismiss: A closure to invoke with the newly selected filters when the user has finished filtering.
    ///   - onDone: A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    public init(selectedSort: String?,
                availableSortCriteria: [SortItem],
                title: String,
                doneButtonTitle: String,
                shouldShowToolbar: Bool = false,
                onDismiss: @escaping (UIViewController) -> Void,
                onDone: @escaping (UIViewController, String?) -> Void) {
        self.selectedSort = selectedSort
        self.availableSortCriteria = availableSortCriteria
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onDismiss = onDismiss
        self.shouldShowToolbar = shouldShowToolbar
        self.onDone = onDone
    }
}
