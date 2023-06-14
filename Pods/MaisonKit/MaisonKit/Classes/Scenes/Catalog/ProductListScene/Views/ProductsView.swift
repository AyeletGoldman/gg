// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

private enum ProductsViewLabels {
    static let searchBarPlaceholder = MKLocalizedString("catalog.product-category.search.searchBar.placeholder",
                                                        comment: "The placeholder for the searchbar in product categoty search")
}

/// A view that shows a list of products
public struct ProductsView<EmptyView: View, WaitingView: View>: View {

    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    private let datasource: ResultState<ProductsScreenDisplayable, ErrorDisplayable>
    private let onRetryTapped: (() -> Void)?
    private let onFilterTapped: (() -> Void)?
    private let onSortTapped: (() -> Void)?
    private let filterBadge: String?
    private let emptyViewClosure: () -> EmptyView?
    private let waitingViewClosure: () -> WaitingView?
    private let onBottomReached: (() -> Void)?
    private let onProductSelected: ((ProductListCellDisplayable) -> Void)?

    /// Creates a new `ProductsView`.
    /// - Parameters:
    ///   - datasource: the source of products to be displayed
    ///   - onRetryTapped: optional. A closure to invoke when the user taps the retry button after an error
    ///   - onFilterTapped: optional. A closure to invoke when the user taps the filter button
    ///   - filterBadge: optional. Text to display in a badge next to the filters button.
    ///   - onSortTapped: optional. A closure to invoke when the sort button is tapped.
    ///   - onProductSelected: optional. A closure to invoke when a product row is tapped.
    ///   - emptyView: a closure to invoke that will return a `View` to be used as an empty state representation.
    ///   - waitingView: a closure to invoke that will return a `View` to be used as the waiting (pre-loading) state representation.
    ///   - onBottomReached: optional. A closure to invoke when the user has scrolled all the way to the bottom of the list of products.
    public init(datasource: ResultState<ProductsScreenDisplayable, ErrorDisplayable>,
                onRetryTapped: (() -> Void)? = nil,
                onFilterTapped: (() -> Void)? = nil,
                filterBadge: String?,
                onSortTapped: (() -> Void)? = nil,
                onProductSelected: ((ProductListCellDisplayable) -> Void)? = nil,
                emptyView: @escaping () -> EmptyView,
                waitingView: @escaping () -> WaitingView,
                onBottomReached: (() -> Void)?) {
        self.datasource = datasource
        self.onRetryTapped = onRetryTapped
        self.onFilterTapped = onFilterTapped
        self.filterBadge = filterBadge
        self.onSortTapped = onSortTapped
        self.onProductSelected = onProductSelected
        self.emptyViewClosure = emptyView
        self.waitingViewClosure = waitingView
        self.onBottomReached = onBottomReached
    }

    public var body: some View {
        VStack(spacing: 0) {
            ResultStateViewBuilder(result: self.datasource)
                .setErroredAction(ButtonData(label: GeneralErrorLabel.retryButtonTitle,
                                             icon: "icon-retry",
                                             action: {
                    self.onRetryTapped?()
                }))
                .setLoadingView { data in
                    // We have 2 loading states here.
                    // If we have data, we show a small spinner in the top left while we retrieve the new results
                    // If we don't have any data, then we show a skeleton
                    if let data = data, !data.items.isEmpty {
                        self.buildToolBarAndProductsList(productsScreen: data,
                                                         toolbarStatus: .loading).unredacted()
                    } else {
                        self.buildToolBarAndProductsList(productsScreen: ProductsScreenDisplayable.loadingDisplayable,
                                                         toolbarStatus: .found(itemCount: 10)) // We don't need to show the loading text while redacted
                    }
                }
                .setEmptyView(self.buildEmptyView)
                .setWaitingView(self.waitingViewClosure)
                .buildContent(self.buildMainView)
            Spacer(minLength: 0)
        }
        .ignoresSafeAreaFromKeyboardAppearance()
        .edgesIgnoringSafeArea(.bottom, if: self.isPresentedModally)
    }

    @ViewBuilder
    private func buildEmptyView() -> some View {
        self.buildMainLayout {
            self.emptyViewClosure()
        } toolBar: {
            // We want to show the filters in case the user filtered away all results.
            ProductsToolbar(status: .found(itemCount: 0),
                            onFilterTapped: self.onFilterTapped,
                            onSortTapped: nil,
                            filterBadge: self.filterBadge)
        }
    }

    @ViewBuilder
    private func buildMainView(productsScreen: ProductsScreenDisplayable) -> some View {
        self.buildToolBarAndProductsList(productsScreen: productsScreen,
                                         toolbarStatus: .found(itemCount: productsScreen.pageInformation.totalAmountOfElements))
    }

    @ViewBuilder
    private func buildToolBarAndProductsList(productsScreen: ProductsScreenDisplayable,
                                             toolbarStatus: ProductsToolbar.Status) -> some View {
        self.buildMainLayout {
            self.buildProductList(cells: productsScreen.items)
        } toolBar: {
            ProductsToolbar(status: toolbarStatus,
                            onFilterTapped: self.onFilterTapped,
                            onSortTapped: self.onSortTapped,
                            filterBadge: self.filterBadge)
        }
    }

    @ViewBuilder
    private func buildMainLayout<Products: View, ToolBar: View>(products: () -> Products,
                                                                toolBar: () -> ToolBar) -> some View {
        VStack(spacing: 0) {
            toolBar()
                .addStyledRowDivider()
            products()
        }.style("background")
    }

    @ViewBuilder
    private func buildProductList(cells: [ProductListCellDisplayable]) -> some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(cells, id: \.id) { displayable in
                    Button(action: {
                        self.onProductSelected?(displayable)
                    }, label: {
                        ProductListCellView(cellDisplayable: displayable)
                    })
                }.onEndReached(self.onBottomReached)
            }
            .padding()
        }
    }
}

extension ProductsView where EmptyView == Never, WaitingView == Never {

    /// Creates a new `ProductsView` where there is no `EmptyView` or `WaitingView`
    /// - Parameters:
    ///   - datasource: the state of the screen modeled as a `ResultState`. This view will configure itself depending on the value of this parameter.
    ///   - onRetryTapped: optional. A closure to execute when the user wants to search
    ///   - onFilterTapped: optional. A closure to execute when the user taps the filter button
    ///   - filterBadge: optional. A badge to display on the filter button. Usually shows the number of filters applied.
    ///   - onSortTapped: optional. A closure to execute when the user taps the sort button.
    public init(datasource: ResultState<ProductsScreenDisplayable, ErrorDisplayable>,
                onRetryTapped: (() -> Void)? = nil,
                onFilterTapped: (() -> Void)? = nil,
                filterBadge: String?,
                onSortTapped: (() -> Void)? = nil) {
        self.datasource = datasource
        self.onRetryTapped = onRetryTapped
        self.onFilterTapped = onFilterTapped
        self.filterBadge = filterBadge
        self.onSortTapped = onSortTapped
        self.onProductSelected = nil
        self.emptyViewClosure = { nil }
        self.waitingViewClosure = { nil }
        self.onBottomReached = nil
    }
}

extension ProductsScreenDisplayable: EmptyStateRepresentable {
    public var isEmpty: Bool {
        return self.items.isEmpty
    }
}

extension ProductsScreenDisplayable {
    static let loadingDisplayable = ProductsScreenDisplayable(items: (0..<20).map { _ in return .loadingDisplayable },
                                                              pageInformation: PageInformation(pageNumber: 0, numberOfPages: 1, totalAmountOfElements: 20))
}

extension ProductListCellDisplayable {
    static var loadingDisplayable: ProductListCellDisplayable {
        return .product(ProductSummaryDisplayable(productId: UUID().uuidString,
                                                  masterId: UUID().uuidString,
                                                  sku: UUID().uuidString,
                                                  image: .styledImage(identifier: "placeholder"),
                                                  properties: Array(repeating: ProductSummaryProperty(label: "Label",
                                                                                                      value: "Some value"),
                                                                    count: 5),
                                                  subtitle: "Category",
                                                  price: .price(CurrencyConvertable(fractionalUnitAmount: 300,
                                                                                    numberOfFractionalUnitsInMonetaryUnit: 1,
                                                                                    currencyCode: "EUR")),
                                                  title: "Product Name"))
    }
}
