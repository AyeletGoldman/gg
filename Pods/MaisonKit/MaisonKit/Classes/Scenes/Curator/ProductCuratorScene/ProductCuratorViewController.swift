//  Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

final class ProductCuratorViewController: StylableViewController<ProductCuratorView> {

    private enum Labels {
        static let close = MKLocalizedString("product-curator.navigation-bar.close.title",
                                             comment: "Title of close button in product curator")
        static let clear = MKLocalizedString("product-curator.navigation-bar.clear.title",
                                             comment: "Title of clear button in product curator")
        static let title = MKLocalizedString("product-curator.navigation-bar.title",
                                             comment: "Title of navigation bar in product curator")
    }

    var viewModel: ProductCuratorViewModel! {
        didSet {
            self.childView = ProductCuratorView(viewModel: viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "products", variant: "curator")
    }

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.$products.sink { [weak self] result in
            guard let self = self else { return }
            let items = result.value ?? []
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.close), action: self.viewModel.didTapClose))
            if items.isEmpty {
                self.setRightBarButtonItems([])
            } else {
                self.setRightBarButtonItem(NavigationButton(title: .text(Labels.clear), action: self.viewModel.didTapClear))
            }
        }.store(in: &self.cancellables)

        self.title = Labels.title

        self.viewModel.listenToProductChanges()
    }
}
