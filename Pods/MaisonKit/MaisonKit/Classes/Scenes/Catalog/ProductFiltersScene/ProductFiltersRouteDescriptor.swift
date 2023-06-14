// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// The route descriptor for the product filters `Scene`
public struct ProductFiltersRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ProductFiltersRouteDescriptor"

    /// The data source to use for the filters. This is an object that defines the data and behaviour of the filters.
    /// Think of it as a combination of a data source and a delegate.
    public let dataSource: FiltersDataSource
    /// A title to show on the filters screen. Usually displayed in the navigation bar.
    public let title: String
    /// A closure to invoke when the user has cancelled filtering
    public let onDismiss: ((UIViewController) -> Void)?
    /// The title of the done button in the navigation bar
    public let doneButtonTitle: String
    /// Whether or not the bottom toolbar should be shown, with a "clear selection" button.
    public let shouldShowToolbar: Bool
    /// A closure to invoke when the user has finished filtering and wants to apply the newly selected filters
    public let onDone: (UIViewController, SelectedFilters) -> Void

    /// Creates a new `ProductFiltersRouteDescriptor`
    /// - Parameters:
    ///   - selectedFilters: A set of selected filters to initialise the scene with
    ///   - filters: The set of available filters.
    ///   - title: A title to show on the filters screen. Usually displayed in the navigation bar.
    ///   - onDismiss: A closure to invoke when the user has cancelled filtering
    ///   - doneButtonTitle: The title of the done button in the navigation bar
    ///   - shouldShowToolbar: Whether or not the bottom toolbar should be shown, with a "clear selection" button.
    ///   - onDone: A closure to invoke when the user has finished filtering and wants to apply the newly selected filters
    public init(selectedFilters: SelectedFilters,
                filters: [FilterData],
                title: String,
                onDismiss: ((UIViewController) -> Void)? = nil,
                doneButtonTitle: String,
                shouldShowToolbar: Bool = false,
                onDone: @escaping (UIViewController, SelectedFilters) -> Void) {
        self.dataSource = DefaultFiltersDataSource(filtersPublisher: Just(.found(filters)).eraseToAnyPublisher(),
                                                   selectedFiltersPublisher: Just(selectedFilters).eraseToAnyPublisher(),
                                                   totalItemsPublisher: nil)
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onDismiss = onDismiss
        self.shouldShowToolbar = shouldShowToolbar
        self.onDone = onDone
    }

    /// Creates a new `ProductFiltersRouteDescriptor`
    /// - Parameters:
    ///   - dataSource: The data source to use for the filters. This is an object that defines the data and behaviour of the filters.
    ///   Think of it as a combination of a data source and a delegate.
    ///   - title: A title to show on the filters screen. Usually displayed in the navigation bar.
    ///   - onDismiss: A closure to invoke when the user has cancelled filtering
    ///   - doneButtonTitle: The title of the done button in the navigation bar
    ///   - shouldShowToolbar: Whether or not the bottom toolbar should be shown, with a "clear selection" button.
    ///   - onDone: A closure to invoke when the user has finished filtering and wants to apply the newly selected filters
    public init(dataSource: FiltersDataSource,
                title: String,
                onDismiss: ((UIViewController) -> Void)? = nil,
                doneButtonTitle: String,
                shouldShowToolbar: Bool = false,
                onDone: @escaping (UIViewController, SelectedFilters) -> Void) {
        self.dataSource = dataSource
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onDismiss = onDismiss
        self.shouldShowToolbar = shouldShowToolbar
        self.onDone = onDone
    }
}
