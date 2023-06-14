// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The entry that represents an outreach that holds a set of children for selection.
/// Upon selecting this entry item the parent will expand to present its children
public struct OutreachSelectionParentEntryItem: Identifiable {
    /// The user interface displayable for this entry
    let item: OutreachSelectionItemDisplayable
    /// The available children for this parent. Must not be empty.
    let children: [OutreachSelectionEntryItem]

    public var id: UUID {
        return self.item.id
    }

    /// Creates a new `OutreachSelectionEntryItem`
    /// - Parameters:
    ///   - item: The user interface displayable for this entry
    ///   - children: The available children for this parent. Must not be empty.
    public init(item: OutreachSelectionItemDisplayable, children: [OutreachSelectionEntryItem]) {
        self.item = item
        self.children = children
    }
}
