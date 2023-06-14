// Copyright © 2020 LVMH. All rights reserved.

import Combine

/// An adapter to retrieve dashboard details
public protocol DashboardAdapter {

    /// Retrieves the items in the dashboard for the given user ID and filters
    /// - Parameters:
    ///   - userId: the ID of the client advisor we want to get the filters for
    ///   - filters: a dictionary of filters to apply to the dasboard result
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `DashboardDisplayable` or an `ErrorDisplayable`.
    func getDashboardItems(userId: String, filters: SelectedFilters?) -> AnyPublisher<Result<DashboardDisplayable, ErrorDisplayable>, Error>
}
