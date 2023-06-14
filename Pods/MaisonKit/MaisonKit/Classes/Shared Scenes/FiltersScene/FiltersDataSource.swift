// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

/// A protocol to define filters data source for having an option to bind the filters data
public protocol FiltersDataSource {
    /// Filters view model apply this function any time there is a change in selected filters
    /// - Parameter selectedFilters: the new selected filters data
    func onSelectedFiltersChange(selectedFilters: SelectedFilters)
    /// The filters publisher. any time there is an updated data the filters screen will update the data. in case of loading state with data the user can still use the filters.
    var filtersPublisher: AnyPublisher<ResultState<[FilterData], ErrorDisplayable>, Never> { get }
    /// The selected filters publisher. any time there is an updated data the filters screen will update the data.
    var selectedFiltersPublisher: AnyPublisher<SelectedFilters, Never> { get }
    /// The total items publisher to show. any time there is an updated data the filters screen will update the data.
    var totalItemsPublisher: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>? { get }
}

struct DefaultFiltersDataSource: FiltersDataSource {
    func onSelectedFiltersChange(selectedFilters: SelectedFilters) { }
    let filtersPublisher: AnyPublisher<ResultState<[FilterData], ErrorDisplayable>, Never>
    let selectedFiltersPublisher: AnyPublisher<SelectedFilters, Never>
    let totalItemsPublisher: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?
}
