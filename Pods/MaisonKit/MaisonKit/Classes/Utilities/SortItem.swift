// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Represents a sort criteria, with a title (localized) and an ID that will
/// be used to to return to the host app when a sort item is selected.
public struct SortItem {

    /// The ID of the sort item, this is the ID that will be returned to the host app when this sort criteria is selected
    public let id: SortID
    /// The title of the sort criteria. This value is displayed to the user and should be localized.
    public let title: String

    /// Creates a new `SortItem` instance
    /// - Parameters:
    ///   - id: The ID of the sort item, this is the ID that will be returned to the host app when this sort criteria is selected
    ///   - title: The title of the sort criteria. This value is displayed to the user and should be localized.
    public init(id: SortID, title: String) {
        self.id = id
        self.title = title
    }
}

/// The ID of a sort criteria
public typealias SortID = String
/// A selected sort criteria
public typealias SelectedSortValue = SortID
