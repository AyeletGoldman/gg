// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import Biodag

final class ProductDetailsViewController: StylableViewController<ProductDetailsView> {

    private enum Labels {
        static let closeButtonTitle = MKLocalizedString("product-details.navigation-bar.close.title",
                                                        comment: "Title of close button in navigation bar")
    }

    var viewModel: ProductDetailsViewModel! {
        didSet {
            self.childView = ProductDetailsView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return "products"
    }

    private var cancellables = Set<AnyCancellable>()
    var onClose: (() -> Void)?

    @Inject private var curatorAdapter: ProductCuratorAdapter

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.$title
            .weakAssign(to: \.title, on: self)
            .store(in: &self.cancellables)

        self.viewModel.fetchProductDetails()
        self.setupNavigationBar()
        self.viewModel.logViewAnalytics()
    }

    private func setupNavigationBar() {
        // We have a closure to invoke so we add a close button
        if let onClose = self.onClose {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.closeButtonTitle),
                                                       action: onClose))
        }

        let productsPublisher = Features.manager.isEnabled(.productCurator) ? self.curatorAdapter.getProductsPublisher() : Just([]).eraseToAnyPublisher()

        Publishers.CombineLatest3(self.viewModel.$availableActions, productsPublisher, self.stylist.$currentTheme)
            .receive(on: DispatchQueue.main) // this is required, because `self.stylist.$currentTheme` fires on `willSet` but we need it on `didSet`
            .sink { [weak self] actions, products, _ in
                guard let self = self else { return }
                self.addMenuItemsBarButtonIfNeeded(actions: actions.navigationActions,
                                                   handleActionTypeAction: self.viewModel.handleActionTypeAction)
                self.addCuratorBarButtonIfNeeded(productCount: products.count, onTap: self.viewModel.presentCurator)
            }.store(in: &self.cancellables)
    }
}
