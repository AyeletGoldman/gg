// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// Holds the information about pagination for a list
public struct PageInformation {
    /// The current page number of the result. This is 0-based (i.e. should start at 0).
    let pageNumber: Int

    /// The number of pages available in the data-source. This is 1-based (i.e. should start at 1).
    let numberOfPages: Int

    /// The total number of elements associated to the pagination
    let totalAmountOfElements: Int

    /// Creates a new `PageInformation`.
    ///  This object holds informatioon about paginatin for a list
    /// - Parameters:
    ///   - pageNumber: The current page number of the result. This is 0-based (i.e. should start at 0).
    ///   - numberOfPages: The number of pages available in the data-source. This is 1-based (i.e. should start at 1).
    ///   - totalAmountOfElements: The total number of elements associated to the pagination
    public init(pageNumber: Int, numberOfPages: Int, totalAmountOfElements: Int) {
        self.pageNumber = pageNumber
        self.numberOfPages = numberOfPages
        self.totalAmountOfElements = totalAmountOfElements
    }

    /// Returns whether or not this list has more pages
    public var hasMorePages: Bool {
        return (self.pageNumber + 1) < numberOfPages
    }
}

/// A data structure to define the contents of a product list screen
public struct ProductsScreenDisplayable {
    let items: [ProductListCellDisplayable]
    let filters: [FilterData]
    let selectedFilters: SelectedFilters?
    let sortItems: [SortItem]
    let selectedSortValue: SelectedSortValue?
    let pageInformation: PageInformation

    /// Creates a new `ProductScreenDisplayable`
    /// - Parameters:
    ///   - items: the products to display
    ///   - filters: _optional_ any set of filters available
    ///   - selectedFilters: _optional_ a dictionary containing a set of filters that have been applied to the result of this list
    ///   - sortItems: an array of sort criteria that can be applied to this list
    ///   - selectedSortValue: _optional_ any selected sort criteria that has been applied to the result of this list
    ///   - pageInformation: pagination information for this list.
    public init(items: [ProductListCellDisplayable],
                filters: [FilterData] = [],
                selectedFilters: SelectedFilters? = nil,
                sortItems: [SortItem] = [],
                selectedSortValue: SelectedSortValue? = nil,
                pageInformation: PageInformation) {
        self.items = items
        self.filters = filters
        self.selectedFilters = selectedFilters
        self.sortItems = sortItems
        self.selectedSortValue = selectedSortValue
        self.pageInformation = pageInformation
    }
}
