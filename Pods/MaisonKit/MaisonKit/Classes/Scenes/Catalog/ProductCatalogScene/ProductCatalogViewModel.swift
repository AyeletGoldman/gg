// Copyright © 2020 LVMH. All rights reserved.

import Combine
import Biodag

/// A view model to manage ProductCategoriesScreenDisplayable
final class CatalogViewModel: ObservableObject {

    /// Hold ResultState for ProductCategoriesScreenDisplayable
    @Published private(set) var productCategories: ResultState<ProductCategoriesScreenDisplayable, ErrorDisplayable> = .waiting
    /// Adapter to manage catalog server calls
    @Inject private var catalogAdapter: CatalogAdapter
    /// A store for subscriptions
    private var productCategoriesCancellable: AnyCancellable?
    /// Main selected item on this page for fetching the data and presenting the page title
    private let selectedCategory: ProductCategory?
    /// The router for this view model. Presents the search and next catalog view.
    private let router: ProductCatalogRouter

    var title: String {
        self.selectedCategory?.title ?? Labels.catalogHeadingTitle
    }

    var displayAllProductsButtonTitle: String {
        self.selectedCategory == nil ? Labels.filterAllButtonTitle : Labels.viewAllButtonTitle
    }

    var isRoot: Bool {
        return self.selectedCategory == nil
    }

    /// Creates a new `CatalogViewModel` with the given category. If no category is given, this is the "parent category" or "first level".
    /// - Parameters:
    ///   - selectedCategory: a `ProductCategory` to create this view model for. Defaults to `nil`.
    ///   - router: the router for this view model; will present and
    init(selectedCategory: ProductCategory? = nil, router: ProductCatalogRouter) {
        self.selectedCategory = selectedCategory
        self.router = router
    }

    func fetchProductCategories(force: Bool = false) {
        guard self.productCategories.isWaiting || force else {
            return
        }
        self.productCategories = .loading(nil)
        self.productCategoriesCancellable = self.catalogAdapter
            .getProductCategories(categoryId: self.selectedCategory?.id)
            .map(ResultState.fromResult)
            .catch { error in
                return Just(.failed(ErrorDisplayable(error)))
            }
            .weakAssign(to: \.productCategories, on: self)
    }

    func didTapCategory(_ category: ProductCategory) {
        switch category.nextScreen {
        case .categories:
            self.router.presentCategory(category)
        case .products:
            self.router.presentProductList(selectedCategory: category)
        }
    }

    func presentCurator() {
        self.router.presentCurator()
    }

    func displayProductList() {
        self.router.presentProductList(selectedCategory: self.selectedCategory)
    }

    func didTapScanBarcode() {
        self.router.presentScanBarcode { [router] reference in
            router.presentProductDetails(context: .product(productId: reference, masterId: nil))
        }
    }
}

extension CatalogViewModel {
    func logViewAnalytics() {
        Analytics.log(ProductCatagoryViewedEvent(categoryId: self.selectedCategory?.id))
    }
}

private extension CatalogViewModel {
    enum Labels {
        static let catalogHeadingTitle = MKLocalizedString("catalog.heading.title", comment: "The title for the catalog heading")
        static let filterAllButtonTitle = MKLocalizedString("catalog.filter-all.button.title", comment: "Title for the 'Filter all' button in the catalog view for showing the product list with the catalog products")
        static let viewAllButtonTitle = MKLocalizedString("catalog.view-all.button.title", comment: "Title for the 'View all' button in the catalog view for showing the product list based on the selected category")
    }
}
