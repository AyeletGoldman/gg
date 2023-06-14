// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A representation of the available entries in an outreach selection scene
/// Each entry can either be a single `item` or a parent `expandableItem` with several children
/// If an entry is of type `item` then the user interface will only show that item and no expansion is possible.
public enum OutreachSelectionEntry: Identifiable {

    /// A single parent item that has all the details to identify an outreach
    case item(OutreachSelectionEntryItem)
    /// An expandable parent item that has an array of child items that will show the method for contact within the parent
    /// This is usually used if an outreach type has many contact forms for example contact via email with a work and personal email available.
    case expandableItem(OutreachSelectionParentEntryItem)

    public var id: UUID {
        switch self {
        case .expandableItem(let item):
            return item.id
        case .item(let item):
            return item.id
        }
    }
}

public extension OutreachSelectionEntry {
    /// Convenience function to create an `OutreachSelectionEntry` with an `ActionType`
    /// - Parameters:
    ///   - item: the item that describes the entry in the view for this row
    ///   - action: the action to perform when this entry is selected
    /// - Returns: An `OutreachSelectionEntry` with a custom action
    static func customAction(item: OutreachSelectionItemDisplayable, action: ActionType) -> Self {
        return .item(OutreachSelectionEntryItem(item: item, actionType: action))
    }
}
