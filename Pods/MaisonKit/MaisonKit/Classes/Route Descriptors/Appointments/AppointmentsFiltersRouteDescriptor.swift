// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the appointments main screen
public struct AppointmentsFiltersRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "AppointmentsFiltersRouteDescriptor"

    /// The set of available filters.
    public let filters: [FilterData]
    /// A set of selected filters to initialise the scene with. This should be a subset of `filters`.
    public let selectedFilters: SelectedFilters
    /// A closure to invoke when the user has finished filtering and wants to apply the newly selected filters
    public let onDone: (UIViewController, SelectedFilters) -> Void

    /// Creates a new `AppointmentsFiltersRouteDescriptor`
    /// - Parameters:
    ///   - filters: The set of available filters.
    ///   - selectedFilters: A set of selected filters to initialise the scene with
    ///   - onDone: A closure to invoke when the user has finished filtering and wants to apply the newly selected filters
    public init(filters: [FilterData],
                selectedFilters: SelectedFilters,
                onDone: @escaping (UIViewController, SelectedFilters) -> Void) {
        self.filters = filters
        self.selectedFilters = selectedFilters
        self.onDone = onDone
    }
}
