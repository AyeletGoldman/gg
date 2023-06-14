// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The item to use in the nested filter list items. This item can use all the `SelectionListItem` constructors.
public typealias NestedFilterListItem = SelectionListItem

public extension NestedFilterListItem {
    /// Creates a new `NestedFilterListItem`
    /// - Parameters:
    ///   - id: The ID for this filter list item.
    ///   - title: The item title to display.
    ///   - content: The content that defines whether we will show an image or color in this filter list item.
    ///   - totalItems: The total matched items if the user will choose this filter item. In case of zero this item will be disabled.
    init(id: String, title: String, content: Content? = nil, totalItems: Int) {
        self = SelectionListItem(id: id,
                                 title: title,
                                 subtitle: { FilterItemTotalItemsView(totalItems: totalItems) },
                                 content: content,
                                 isEnabled: totalItems > 0)
    }
}
