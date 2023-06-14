// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public struct SortMemberListRouteDescriptor: RouteDescriptor {

    public static let identifier: Identifier = "SortMemberListRouteDescriptor"

    /// The list of available sort items
    public let sortItems: [SortItem]
    /// The initial sort value to be selected, if any. This ID must match the ID of one of the `SortItem`s in the `sortItems` property.
    public let initialSortValue: String?
    /// The title of the scene. Usually shown in the navigation bar.
    public let title: String
    /// The title of the done button
    public let doneButtonTitle: String
    /// A closure to invoke with the newly selected filters when the user has finished filtering.
    public let onDone: (UIViewController, String?) -> Void
    /// A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    public let onClose: ((UIViewController) -> Void)

    /// Creates a new `SortMemberListRouteDescriptor`
    /// - Parameters:
    ///   - sortItems: The list of available sort items
    ///   - initialSortValue: The initial sort value to be selected, if any. This ID must match the ID of one of the `SortItem`s in the `sortItems` property.
    ///   - title: The title of the scene. Usually shown in the navigation bar.
    ///   - doneButtonTitle: The title of the done button
    ///   - onDone: A closure to invoke with the newly selected filters when the user has finished filtering.
    ///   - onClose: A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    public init(sortItems: [SortItem],
                initialSortValue: String?,
                title: String,
                doneButtonTitle: String,
                onDone: @escaping (UIViewController, String?) -> Void,
                onClose: @escaping (UIViewController) -> Void) {
        self.sortItems = sortItems
        self.initialSortValue = initialSortValue
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onDone = onDone
        self.onClose = onClose
    }
}
