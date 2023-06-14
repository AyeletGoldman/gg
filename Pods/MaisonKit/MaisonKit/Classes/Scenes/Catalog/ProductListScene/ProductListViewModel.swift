// Copyright © 2020 LVMH. All rights reserved.

import Combine
import Biodag

private enum Labels {
    static let totalItemsTitle = MKLocalizedString("product-list.filters.matched-products.title",
                                                   comment: "The text to show inside the product list filters screen with the number of matched products in the variable")
    static let alertConfirmationClearButtonTitle = MKLocalizedString("catalog.search.recently-searched.alert.clear-confirmation.button.title",
                                                                     comment: "Title for button when clearing recent products searches")
    static let alertConfirmationClearTitle = MKLocalizedString("catalog.search.recently-searched.alert.clear-confirmation.title",
                                                               comment: "The title for the alert when clearing recent products searches")
    static let alertConfirmationClearMessage = MKLocalizedString("catalog.search.recently-searched.alert.clear-confirmation.message",
                                                                 comment: "Message for the alert when clearing recent products searches")
    static let recentlySearchedHelpBody = MKLocalizedString("catalog.search.recently-searched.help.body", comment: "The help text body in the recently searched products view")

}

public final class ProductListViewModel: ObservableObject {

    private enum Constants {
        static let cacheObjectId = "recentProductSearches"
    }

    /// Hold ResultState for ProductsScreenDisplayable
    @Published private(set) var dataSource: ResultState<ProductsScreenDisplayable, ErrorDisplayable> = .waiting {
        didSet {
            self.presentFiltersIfNeeded()
        }
    }
    /// Hold the selected filters
    @Published var selectedFilters: SelectedFilters = [:]
    /// The text to search
    @Published var searchText = ""

    var hasMoreResults: Bool {
        self.dataSource.value?.pageInformation.hasMorePages ?? false
    }
    /// Text sort value for sorting the products list
    private(set) var selectedSortValue: SelectedSortValue?
    /// Adapter to manage catalog server calls
    @Inject private var catalogAdapter: CatalogAdapter
    /// A store for subscriptions
    private var cancellables = Set<AnyCancellable>()
    /// Cancellable only for fetch for using only the latest publisher call
    private var fetchSubscription: AnyCancellable?
    /// We store the search subscription separately, so we cancel it if necessary
    private var searchSubscription: AnyCancellable?
    /// Main selected item on this page for fetching the data and presenting the page title
    let displayMode: ProductListDisplayMode
    /// The actual object that performs the search
    private let searchPerformer: SearchPerformer<ProductsScreenDisplayable, ProductListViewModel>
    /// The router for this view model. Presents the product details, filters and sort views
    private let router: ProductListRouter
    /// Indicates whether filters popup should be presented automatically when getting the data at the first time or not. Will be in use mainly on similar products display mode.
    private var shouldPresentFiltersAutomatically: Bool
    /// The pagination handler for requests
    private let paginationManager = PaginationManager()

    @Published var alertContext: AlertContext?

    fileprivate let recentSearchesPerformer: RecentSearchesPerformer

    @Published private(set) var shouldPresentRecentSearches: Bool = false
    @Published var isSearchMode: Bool = false

    public init(displayMode: ProductListDisplayMode,
                shouldPresentFiltersAutomatically: Bool = false,
                router: ProductListRouter) {
        self.displayMode = displayMode
        self.shouldPresentFiltersAutomatically = shouldPresentFiltersAutomatically
        self.searchPerformer = SearchPerformer()
        self.router = router
        self.recentSearchesPerformer = RecentSearchesPerformer(cacheObjectId: Constants.cacheObjectId)
        self.searchPerformer.delegate = self

        self.defineSelectedFiltersPublisher()
        self.definePublishersForSearchMode()
    }

    private func fetchProducts() {
        self.paginationManager.resetPagination()
        self.fetchSubscription = self.getProductsRequest(searchText: self.searchText)
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
            }
            .sink(receiveValue: { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.dataSource = .failed(error)
                case .success(let displayable):
                    self?.setFoundResult(displayable: displayable)
                }
            })
    }

    private func getProductsRequest(searchText: String) -> AnyPublisher<Result<ProductsScreenDisplayable, ErrorDisplayable>, Error> {
        switch self.displayMode {
        case .productCategory(let productCategory):
            return self.paginationManager.currentPageIndex.flatMap { [weak self, catalogAdapter] pageIndex in
                return catalogAdapter.getProductsByCategory(categoryId: productCategory?.id,
                                                            filters: self?.selectedFilters,
                                                            sortBy: self?.selectedSortValue,
                                                            searchText: searchText.isEmpty ? nil : searchText,
                                                            pageIndex: pageIndex)
            }.eraseToAnyPublisher()
        case .similarProducts(let productId):
            return self.paginationManager.currentPageIndex.flatMap { [weak self, catalogAdapter] pageIndex in
                return catalogAdapter.getSimilarProducts(to: productId,
                                                         filters: self?.selectedFilters,
                                                         sortBy: self?.selectedSortValue,
                                                         searchText: searchText.isEmpty ? nil : searchText,
                                                         pageIndex: pageIndex)
            }.eraseToAnyPublisher()
        case .globalSearch:
            return self.paginationManager.currentPageIndex.flatMap { [weak self, catalogAdapter] pageIndex in
                return catalogAdapter.searchProducts(searchText: searchText,
                                                     filters: self?.selectedFilters,
                                                     sortBy: self?.selectedSortValue,
                                                     pageIndex: pageIndex)
            }.eraseToAnyPublisher()
        }
    }

    private func setFoundResult(displayable: ProductsScreenDisplayable) {
        /// If we already had a displayable, then we are fetching the next page, so we merge them together.
        if let currentDisplayable = self.dataSource.value,
           currentDisplayable.pageInformation.pageNumber < displayable.pageInformation.pageNumber {
            self.dataSource = .found(currentDisplayable.merge(other: displayable))
        } else {
            self.dataSource = .found(displayable)
        }
        self.selectedFilters = displayable.selectedFilters ?? [:]
        self.selectedSortValue = displayable.selectedSortValue
    }

    func fetchProductsOnAppear() {
        guard case .waiting = self.dataSource else {
            return
        }
        if case .globalSearch = self.displayMode {
            return // in case of global search we should present Recently searched screen on appear
        }
        self.dataSource = .loading(nil)
        self.fetchProducts()
    }

    private func presentFiltersIfNeeded() {
        if self.shouldPresentFiltersAutomatically, case .found = self.dataSource {
            self.shouldPresentFiltersAutomatically = false
            // We dispatch async to allow the displayable to set up the selected filters
            // and sort value before showing the filters data. Otherwise, what happens
            // is that the filters UI is displayed but the selected filters are not
            // selected, because `self.selectedFilters` is still `[]`.
            DispatchQueue.main.async {
                self.didTapFilter()
            }
        }
    }

    func didReachEndOfProductList() {
        guard let pageNumber = self.dataSource.value?.pageInformation.pageNumber else { return }
        self.paginationManager.fetchNextPageIfNeeded(currentPageIndex: pageNumber)
    }

    func presentCurator() {
        self.router.presentCurator()
    }

    private func defineSelectedFiltersPublisher() {
        self.$selectedFilters
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] selectedFilters in
                if selectedFilters != self?.dataSource.value?.selectedFilters ?? [:] {
                    // If the new selected filters not equal to the current one, fetch the data again.
                    self?.dataSource = .loading(self?.dataSource.value)
                    self?.fetchProducts()
                } else {
                    if case .loading(let dataSourceValue) = self?.dataSource, let dataSourceValue = dataSourceValue {
                        // If the new selected filters equal to the current one and we are on loading state,
                        // cancel the request and stop the loading.
                        self?.fetchSubscription?.cancel()
                        self?.fetchSubscription = nil
                        self?.dataSource = .found(dataSourceValue)
                    }
                }
            }
            .store(in: &self.cancellables)
    }

    func definePublishersForSearchMode() {
        self.$dataSource
            .sink(receiveValue: { [weak self] dataSource in
                guard let self = self, self.isSearchMode else { return }
                self.shouldPresentRecentSearches = dataSource.isWaiting || self.searchText.isEmpty
            })
            .store(in: &self.cancellables)

        self.$isSearchMode
            .sink(receiveValue: { [weak self] isSearchMode in
                self?.shouldPresentRecentSearches = isSearchMode
            })
            .store(in: &self.cancellables)
    }
}

extension ProductListViewModel: FiltersDataSource {
    public func onSelectedFiltersChange(selectedFilters: SelectedFilters) {
        self.selectedFilters = selectedFilters
    }

    public var filtersPublisher: AnyPublisher<ResultState<[FilterData], ErrorDisplayable>, Never> {
        return self.$dataSource.share().map { dataSource in
            switch dataSource {
            case .waiting:
                return .waiting
            case .loading(let value):
                // If we have filters already we don't want to show any loading states
                if let filters = value?.filters {
                    return .found(filters)
                } else {
                    return .loading(nil)
                }
            case .found(let value):
                return .found(value.filters)
            case .failed(let error):
                return .failed(error)
            }
        }.eraseToAnyPublisher()
    }

    public var selectedFiltersPublisher: AnyPublisher<SelectedFilters, Never> {
        return self.$selectedFilters.eraseToAnyPublisher()
    }

    public var totalItemsPublisher: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>? {
        let totalItemsTitle = { (value: ProductsScreenDisplayable) -> String in
            String(format: Labels.totalItemsTitle, value.pageInformation.totalAmountOfElements)
        }
        return self.$dataSource.share().map { dataSource in
            switch dataSource {
            case .waiting:
                return .waiting
            case .loading(let value):
                return .loading(value.map { totalItemsTitle($0) })
            case .found(let value):
                return .found(totalItemsTitle(value))
            case .failed(let error):
                return .failed(error)
            }
        }.eraseToAnyPublisher()
    }
}

extension ProductListViewModel {
    func logViewAnalytics() {
        switch self.displayMode {
        case .productCategory(let productCategory):
            Analytics.log(ProductListViewedEvent(productListId: productCategory?.id))
        case .similarProducts(let productId):
            Analytics.log(SimilarProductsViewedEvent(productId: productId))
        case .globalSearch:
            Analytics.log(SearchProductViewedEvent())
        }
    }
}

extension SelectedFilters {
    var filterButtonBadge: String? {
        let filters = self.filter { !$1.isEmpty }
        return filters.isEmpty ? nil : "\(filters.count)"
    }
}

// MARK: - Responding to user events
extension ProductListViewModel {
    func didTapFilter() {
        self.router.presentProductFilters(dataSource: self,
                                          onCancel: { [weak self, selectedFilters] in
            // Reset the filters to the captured set of filters that were originally in the list.
            self?.selectedFilters = selectedFilters
        })
    }

    func didTapSort() {
        guard let sortItems = self.dataSource.value?.sortItems else { return }
        self.router.presentProductSort(sortItems: sortItems,
                                       selectedSortValue: self.selectedSortValue,
                                       onDone: self.sortProducts)
    }

    func didTapProduct(_ displayable: ProductListCellDisplayable) {
        self.router.presentProductDetails(context: ProductDetailsInitialisationContext(from: displayable))
        self.recentSearchesPerformer.addToRecentSearches(text: self.searchPerformer.lastSearch)
    }

    func sortProducts(selectedSortId: String?) {
        self.selectedSortValue = selectedSortId
        self.dataSource = .loading(nil)
        self.fetchProducts()
    }

    func didCommitSearch() {
        self.searchPerformer.performSearch(withText: self.searchText)
    }

    func stopListeningToSearchTextUpdates() {
        if !self.searchText.isEmpty {
            self.searchText = ""
        }
        self.searchSubscription?.cancel()
        self.searchSubscription = nil
    }

    func startListeningToSearchTextUpdates() {
        self.searchSubscription = self.$searchText
            .dropFirst()
            .removeDuplicates()
            .sink(receiveValue: { [searchPerformer] text in
                searchPerformer.performSearch(withText: text)
            })
    }

    func didTapScanBarcode() {
        self.router.presentScanBarcode { [router] reference in
            router.presentProductDetails(context: .product(productId: reference, masterId: nil))
        }
    }
}

extension ProductDetailsInitialisationContext {
    init(from displayable: ProductListCellDisplayable) {
        switch displayable {
        case .master(let master):
            self = .master(masterId: master.id)
        case .product(let product):
            self = .product(productId: product.productId, masterId: product.masterId)
        }
    }
}

extension ProductListViewModel: SearchPerformerDelegate {
    public func searchPerformerDidStartLoading() {
        self.dataSource = .loading(nil)
    }

    public func searchPerformerDidFindSearchResult(_ result: ResultState<ProductsScreenDisplayable, ErrorDisplayable>) {
        switch result {
        case .waiting:
            // When `searchText` is empty we would like to ignore `searchText` and get the full products list.
            self.dataSource = .loading(self.dataSource.value)
            self.fetchProducts()
        case .found(let displayable):
            self.setFoundResult(displayable: displayable)
        default:
            self.dataSource = result
        }
    }

    public func buildRequestForSearchPerformer(withText text: String) -> AnyPublisher<Result<ProductsScreenDisplayable, ErrorDisplayable>, Error> {
        // Reset the page index when we are starting search again
        self.paginationManager.resetPagination()
        return self.getProductsRequest(searchText: text)
    }

    public func handleSearchEvent(withText text: String) {
        Analytics.log(SearchPerformedEvent(source: .productCategoryItems, query: text))
    }
}

extension ProductsScreenDisplayable {
    func merge(other: ProductsScreenDisplayable) -> ProductsScreenDisplayable {
        return ProductsScreenDisplayable(items: self.items + other.items,
                                         filters: other.filters,
                                         selectedFilters: other.selectedFilters,
                                         sortItems: other.sortItems,
                                         selectedSortValue: other.selectedSortValue,
                                         pageInformation: other.pageInformation)
    }
}

extension ProductListViewModel {
    fileprivate func recentSearchTapped(withText text: String) {
        self.searchText = text
        Analytics.log(RecentSearchTappedEvent(source: .catalog, query: text))
    }

    func resetRecentSearchesAlert() {
        let secondaryButton = AlertContext.Button(title: Labels.alertConfirmationClearButtonTitle,
                                                  style: .destructive(action: self.recentSearchesPerformer.resetRecentSearches))
        self.alertContext = AlertContext(title: Labels.alertConfirmationClearTitle,
                                         message: Labels.alertConfirmationClearMessage,
                                         secondaryButton: secondaryButton)
    }
}

extension RecentlySearchedView {
    init(viewModel: ProductListViewModel) {
        self.init(onRecentlySearchTapped: viewModel.recentSearchTapped,
                  onClearTapped: viewModel.resetRecentSearchesAlert,
                  recentSearches: viewModel.recentSearchesPerformer.recentSearches,
                  recentlySearchedHelpBodyText: Labels.recentlySearchedHelpBody)
    }
}
