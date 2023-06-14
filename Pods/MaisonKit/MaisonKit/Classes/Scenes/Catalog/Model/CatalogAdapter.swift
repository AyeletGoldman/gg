// Copyright © 2020 LVMH. All rights reserved.

import Combine

/// An adapter protocol for product lists, used to retrieve products and categories
public protocol CatalogAdapter {

    /// Retrieves the product categories for a maison. If given a category ID, will retrieve categories that are sub-categories of the one with the given ID.
    /// - Parameter categoryId: _optional_ the parent category ID to retrieve subcategories from.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ProductCategoriesScreenDisplayable` or an `ErrorDisplayable`.
    func getProductCategories(categoryId: String?) -> AnyPublisher<Result<ProductCategoriesScreenDisplayable, ErrorDisplayable>, Error>

    /// Retrieves a list of products related to a specific category given a set of criteria
    /// - Parameters:
    ///   - categoryId: the parent category ID for this product list
    ///   - filters: _optional_ a set of filters to apply to the results
    ///   - sortBy: _optional_ a specified sort value to order results by
    ///   - searchText: _optional_ a specified free-text value that will be used to search the product catalog
    ///   - pageIndex: the page number that MaisonKit is asking to retrieve. Starts at 0.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ProductsScreenDisplayable` or an `ErrorDisplayable`.
    func getProductsByCategory(categoryId: String?,
                               filters: SelectedFilters?,
                               sortBy: SelectedSortValue?,
                               searchText: String?,
                               pageIndex: Int) -> AnyPublisher<Result<ProductsScreenDisplayable, ErrorDisplayable>, Error>

    /// Retrieves a list of products given a set of criteria
    /// - Parameters:
    ///   - productId: the product identifier for showing similar products to.
    ///   - filters: _optional_ a set of filters to apply to the results
    ///   - sortBy: _optional_ a specified sort value to order results by
    ///   - searchText: _optional_ a specified free-text value that will be used to search the product catalog
    ///   - pageIndex: the page number that MaisonKit is asking to retrieve. Starts at 0.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ProductsScreenDisplayable` or an `ErrorDisplayable`.
    func getSimilarProducts(to productId: String,
                            filters: SelectedFilters?,
                            sortBy: SelectedSortValue?,
                            searchText: String?,
                            pageIndex: Int) -> AnyPublisher<Result<ProductsScreenDisplayable, ErrorDisplayable>, Error>

    /// Searches the whole catalog for a given search criteria
    /// - Parameters:
    ///   - searchText: the text to use to filter the results
    ///   - filters: a list of selected filters to apply to search results
    ///   - sortBy: the order in which the results are expected to be returned
    ///   - pageIndex: the page of results to retrieve, starts at 0
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ProductsScreenDisplayable` or an `ErrorDisplayable`.
    func searchProducts(searchText: String,
                        filters: SelectedFilters?,
                        sortBy: SelectedSortValue?,
                        pageIndex: Int) -> AnyPublisher<Result<ProductsScreenDisplayable, ErrorDisplayable>, Error>

    /// Retrieves an array of product summaries given a set of product SKUs
    /// - Parameter productIds: an array of product IDs to get the details for
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `[ProductListCellDisplayable]` or an `ErrorDisplayable`.
    func getProductSummaries(productIds: [String]) -> AnyPublisher<Result<[ProductListCellDisplayable], ErrorDisplayable>, Error>
}

/// An adapter protocol for product details, used to retrieve a product's details in either `master` or `product` state.
public protocol CatalogDetailsAdapter {

    /// Asks the adapter to retrieve the product details given a particular product ID or product master ID.
    /// This method is called when the user first arrives to the product details scene and every time the selected attributes change.
    /// - Parameter productId: the ID of the product to get the details for.
    /// - Parameter selectedAttributes: the dictionary of attribute ID to attribue value that are selected for this product
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ProductDetailsDisplayable` or an `ErrorDisplayable`.
    func getProductDetails(productId: String, selectedAttributes: [ProductAttributeID: String]?) -> AnyPublisher<Result<ProductDetailsDisplayable, ErrorDisplayable>, Error>

    /// Retrieves the stock information that is displayed on the product/master details page.
    /// - Parameter productId: a product's ID
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `StockInformationDisplayable` or an `ErrorDisplayable`.
    func getProductStock(productId: String) -> AnyPublisher<Result<StockInformationDisplayable, ErrorDisplayable>, Error>
}
