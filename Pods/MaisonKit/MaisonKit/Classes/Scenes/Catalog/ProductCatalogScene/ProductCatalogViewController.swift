// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import Biodag
import StylableSwiftUI

final class ProductCatalogViewController: TabBarRootViewController<CatalogView> {

    private enum Labels {
        static let searchBarPlaceholder = MKLocalizedString("product-catalog.search.placeholder",
                                                            comment: "The placeholder for searching in product catalog")
    }

    var viewModel: CatalogViewModel! {
        didSet {
            self.childView = CatalogView(viewModel: self.viewModel)
            self.subscribeToProductsIfNecessary()
        }
    }

    var searchController: MKSearchController? {
        didSet {
            self.searchController?.searchBarPlaceholder = Labels.searchBarPlaceholder
            self.searchController?.delegate = searchController?.searchResultsController as? UISearchControllerDelegate
            self.navigationItem.searchController = self.searchController
        }
    }

    override var stylistSection: String? {
        return "products"
    }

    @Inject private var adapter: ProductCuratorAdapter
    private var cancellables = Set<AnyCancellable>()

    override var tabBarImageIcon: String { return "icon-products" }
    override var tabBarTitle: String { return MKLocalizedString("tab.catalog.title", comment: "The tab icon title for Product catalogue") }
    private var barcodeDelegate: BarcodeDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.viewModel.title

        self.setupNavigationBarButtons()
        self.searchController?.isPresentedInModalContext = self.isModal
        self.searchController?.styleSearchBar()

        self.barcodeDelegate = BarcodeDelegate(onTapBarcodeButton: self.viewModel.didTapScanBarcode)
        self.searchController?.setupSearchBarForBarcodeScanIfNecessary(stylist: self.stylist, delegate: self.barcodeDelegate)

        self.viewModel.fetchProductCategories()
        self.viewModel.logViewAnalytics()
    }

    private func subscribeToProductsIfNecessary() {
        if self.viewModel.isRoot, Features.manager.isEnabled(.productCurator) {
            self.adapter.getProductsPublisher().sink { [weak self] products in
                self?.tabBarItem.badgeValue = products.isEmpty ? nil : "\(products.count)"
            }.store(in: &self.cancellables)
        }
    }

    private func setupNavigationBarButtons() {
        if Features.manager.isEnabled(.productCurator) {
            self.adapter.getProductsPublisher().sink { [weak self] products in
                guard let self = self else { return }
                self.setRightBarButtonItems([])
                self.addCuratorBarButtonIfNeeded(productCount: products.count, onTap: self.viewModel.presentCurator)
            }.store(in: &self.cancellables)
        }
    }
}
