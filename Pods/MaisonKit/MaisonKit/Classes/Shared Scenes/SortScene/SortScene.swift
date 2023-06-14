// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension SelectionListScene {

    /// The scene for sort selection, implemented by `SelectionListScene`.
    /// - Parameters:
    ///   - items: The sort items
    ///   - selection: The default sort selection to start with
    ///   - title: The sort page title
    ///   - onDismiss: A closure to invoke when this model represents is dismissed without saving the changes. Defaults to `nil`.
    ///   - doneButtonTitle: The title of the done button
    ///   - onDone: A closure to invoke when the user has finished and wants to apply the newly selected item to sort by
    /// - Returns: a new `SelectionListScene` configured for sorting the given `SortItem`s.
    static func sortSelectionListScene(items: [SortItem],
                                       selection: String?,
                                       title: String,
                                       onDismiss: ((UIViewController) -> Void)? = nil,
                                       doneButtonTitle: String,
                                       onDone: @escaping (UIViewController, String?) -> Void) -> SelectionListScene {
        return Self.singleSelectionListScene(items: items.map { SelectionListItem(id: $0.id, title: $0.title) },
                                             selection: selection,
                                             title: title,
                                             onDismiss: onDismiss,
                                             doneButtonTitle: doneButtonTitle,
                                             onDone: onDone,
                                             shouldShowToolbar: false)
    }
}
