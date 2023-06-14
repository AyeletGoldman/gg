// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A displayable to represent the dashboard data
public struct DashboardDisplayable {
    /// The dashboard page title
    let title: String
    /// The items to show in the dashboard
    let items: [any StatItemDisplayView]
    /// The filters the user can filter by to show.
    let filters: [FilterData]
    /// The selected filters for these dashboard rows data.
    let selectedFilters: SelectedFilters

    /// Creates a new DashboardDisplayable to be used in dashboard screen
    /// - Parameters:
    ///   - title: The dashboard row items to show depends of the selected filters.
    ///   - items: The dashboard items to show depends of the selected filters.
    ///   - filters: The filters the user can filter by to show.
    ///   - selectedFilters: The selected filters for these dashboard rows data.
    public init(title: String, items: [any StatItemDisplayView], filters: [FilterData], selectedFilters: SelectedFilters) {
        self.title = title
        self.items = items
        self.filters = filters
        self.selectedFilters = selectedFilters
    }
}
