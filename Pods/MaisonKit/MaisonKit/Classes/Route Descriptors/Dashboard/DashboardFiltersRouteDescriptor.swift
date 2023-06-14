// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the dashboard filters
public struct DashboardFiltersRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "DashboardFiltersRouteDescriptor"

    /// The set of selected filters to display in the scene. This is a subset of items in `filters`.
    public let selectedFilters: SelectedFilters
    /// Each of the rows to be displayed in the filters scene. Each of these filters has a title and a set of available filters.
    public let filters: [FilterData]
    /// The title of the scene. Usually shown in the navigation bar.
    public let title: String
    /// A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    public let onDismiss: ((UIViewController) -> Void)?
    /// The title of the done button
    public let doneButtonTitle: String
    /// Whether or not to show the toolbar at the bottom of the screen
    public let shouldShowToolbar: Bool
    /// A closure to invoke with the newly selected filters when the user has finished filtering.
    public let onDone: (UIViewController, SelectedFilters) -> Void

    /// Creates a new `DashboardFiltersRouteDescriptor`.
    /// - Parameters:
    ///   - selectedFilters: The set of selected filters to display in the scene. This is a subset of items in `filters`.
    ///   - filters: Each of the rows to be displayed in the filters scene. Each of these filters has a title and a set of available filters.
    ///   - title: The title of the scene. Usually shown in the navigation bar.
    ///   - onDismiss: A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    ///   - doneButtonTitle: The title of the done button
    ///   - shouldShowToolbar: Whether or not to show the toolbar at the bottom of the screen
    ///   - onDone: A closure to invoke with the newly selected filters when the user has finished filtering.
    public init(selectedFilters: SelectedFilters,
                filters: [FilterData],
                title: String,
                onDismiss: ((UIViewController) -> Void)? = nil,
                doneButtonTitle: String,
                shouldShowToolbar: Bool = false,
                onDone: @escaping (UIViewController, SelectedFilters) -> Void) {
        self.selectedFilters = selectedFilters
        self.filters = filters
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onDismiss = onDismiss
        self.shouldShowToolbar = shouldShowToolbar
        self.onDone = onDone
    }
}
