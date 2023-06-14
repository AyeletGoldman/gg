// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The displayable to represent all available entries in an outreach selection scene
public struct OutreachSelectionDisplayable {

    /// An array of outreach selection entries. Each entry may be a single item or an item with children in it.
    /// The children are displayed when the parent is tapped.
    public let entries: [OutreachSelectionEntry]

    /// Creates a new `OutreachSelectionDisplayable` with the given `entries`
    /// - Parameter entries: An array of outreach selection entries. Each entry may be a single item or an item with children in it.
    /// The children are displayed when the parent is tapped.
    public init(entries: [OutreachSelectionEntry]) {
        self.entries = entries
    }
}
