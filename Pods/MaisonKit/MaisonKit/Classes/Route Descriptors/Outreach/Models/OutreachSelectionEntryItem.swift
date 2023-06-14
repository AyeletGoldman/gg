// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The entry that represents an outreach that can be selected
public struct OutreachSelectionEntryItem: Identifiable {

    /// The type of the entry, this can either be an outreach or a custom action
    public enum EntryType {
        /// The outreach entry type. Setting this type indicates that MaisonKit will attempt to initiate an outreach flow with
        /// the given `OutreachType` and `String?` as a recipient.
        case outreach(OutreachType, String?)
        /// The action entry type. The action in this case will be executed when the user taps this entry.
        case action(ActionType)
    }

    /// The user interface displayable for this entry
    public let item: OutreachSelectionItemDisplayable
    /// The type of the entry, this can either be an outreach or a custom action
    public let entryType: EntryType

    public var id: UUID {
        return self.item.id
    }

    /// Creates a new `OutreachSelectionEntryItem`
    /// - Parameters:
    ///   - item: The user interface displayable for this entry
    ///   - recipient: The recipient of the outreach. This would usually be something like an email address or
    ///   a phone number. It is optional, because some outreach types don't require a recipient (e.g. wechat)
    ///   - outreachType: The type of outreach for this entry.
    public init(item: OutreachSelectionItemDisplayable, recipient: String?, outreachType: OutreachType) {
        self.item = item
        self.entryType = .outreach(outreachType, recipient)
    }

    /// Creates a new `OutreachSelectionEntryItem`
    /// - Parameters:
    ///   - item: The user interface displayable for this entry
    ///   - actionType: The action to perform when this cell is tapped
    public init(item: OutreachSelectionItemDisplayable, actionType: ActionType) {
        self.item = item
        self.entryType = .action(actionType)
    }

    /// Creates a new `OutreachSelectionEntryItem`
    /// - Parameters:
    ///   - item: The user interface displayable for this entry
    ///   - entryType: The type of the entry, this can either be an outreach or a custom action
    public init(item: OutreachSelectionItemDisplayable, entryType: EntryType) {
        self.item = item
        self.entryType = entryType
    }
}
