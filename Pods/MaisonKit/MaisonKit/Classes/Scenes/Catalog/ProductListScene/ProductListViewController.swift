// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import Biodag

final class ProductListViewController: StylableViewController<ProductListSceneView> {

    var viewModel: ProductListViewModel! {
        didSet {
            self.childView = ProductListSceneView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return "products"
    }

    var searchController: MKSearchController? {
        didSet {
            self.searchController?.searchBarPlaceholder = self.viewModel.displayMode.searchBarPlaceholder
            self.searchController?.obscuresBackgroundDuringPresentation = false
            self.searchController?.searchResultsUpdater = self
            self.searchController?.delegate = self
            self.navigationItem.searchController = self.searchController
        }
    }

    private var cancellables = Set<AnyCancellable>()
    @Inject private var curatorAdapter: ProductCuratorAdapter
    private var barcodeDelegate: BarcodeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.displayMode.pageTitle

        self.viewModel.fetchProductsOnAppear()
        self.viewModel.logViewAnalytics()
        self.searchController?.isPresentedInModalContext = self.isModal
        self.searchController?.styleSearchBar()

        if Features.manager.isEnabled(.productCurator) {
            self.curatorAdapter.getProductsPublisher().sink { [weak self] products in
                guard let self = self else { return }
                self.setRightBarButtonItems([])
                self.addCuratorBarButtonIfNeeded(productCount: products.count, onTap: self.viewModel.presentCurator)
            }.store(in: &self.cancellables)
        }

        self.viewModel.$searchText.sink { [weak self] text in
            guard let searchController = self?.searchController ?? self?.parent as? UISearchController else { return }
            guard text != searchController.searchBar.text else { return }
            searchController.searchBar.text = text
        }.store(in: &self.cancellables)

        self.barcodeDelegate = BarcodeDelegate(onTapBarcodeButton: self.viewModel.didTapScanBarcode)
        self.searchController?.setupSearchBarForBarcodeScanIfNecessary(stylist: self.stylist, delegate: self.barcodeDelegate)
    }
}

extension ProductListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.viewModel.searchText = searchController.searchBar.text ?? ""
    }
}

extension ProductListViewController: UISearchControllerDelegate {
    func willDismissSearchController(_ searchController: UISearchController) {
        self.viewModel.stopListeningToSearchTextUpdates()
        self.viewModel.isSearchMode = false
    }

    func didPresentSearchController(_ searchController: UISearchController) {
        self.viewModel.startListeningToSearchTextUpdates()
    }

    func willPresentSearchController(_ searchController: UISearchController) {
        self.viewModel.isSearchMode = true
    }
}

private extension ProductListDisplayMode {

    private enum Labels {
        // swiftlint:disable line_length
        static let allProductsTitle = MKLocalizedString("catalog.product-list.all-products.title",
                                                        comment: "The screen title to show on product list screen while displaying all products")
        static let similarProductsTitle = MKLocalizedString("catalog.product-list.similar-products.title",
                                                            comment: "The screen title to show on product list screen in case of similar products mode")
        static let globalSearchTitle = MKLocalizedString("catalog.search.title",
                                                         comment: "The navigation bar title on the global catalog search")
        static let searchBarPlaceholder = MKLocalizedString("catalog.product-list.search.placeholder",
                                                            comment: "The placeholder for searching lists in product catalog. The placeholder is the name of the category being searched.")
        static let similarProductsSearchBarPlaceholder = MKLocalizedString("catalog.product-list.search.similar-products.placeholder",
                                                                           comment: "The placeholder for searching a similar products list")
        static let globalSearchBarPlaceholder = MKLocalizedString("catalog.search.placeholder",
                                                                 comment: "The placeholder for global searching in product catalog.")
        // swiftlint:enable line_length
    }

    var pageTitle: String {
        switch self {
        case .productCategory(let productCategory):
            return productCategory?.title ?? Labels.allProductsTitle
        case .similarProducts:
            return Labels.similarProductsTitle
        case .globalSearch:
            return Labels.globalSearchTitle
        }
    }

    var searchBarPlaceholder: String {
        switch self {
        case .productCategory(let productCategory):
            return String(format: Labels.searchBarPlaceholder, productCategory?.title ?? Labels.allProductsTitle)
        case .similarProducts:
            return Labels.similarProductsSearchBarPlaceholder
        case .globalSearch:
            return Labels.globalSearchBarPlaceholder
        }
    }
}
