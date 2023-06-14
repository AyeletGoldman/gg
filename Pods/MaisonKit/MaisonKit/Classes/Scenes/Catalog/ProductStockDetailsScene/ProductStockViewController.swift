// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class ProductStockViewController: StylableViewController<ProductStockDetailsSceneView> {

    private enum Labels {
        static let navigationBarDoneButtonTitle = MKLocalizedString("product-stock.navigationBar.leading.done",
                                                                    comment: "Title for the navigation bar button that closes the product stock display")
    }

    var viewModel: ProductStockViewModel! {
        didSet {
            self.childView = ProductStockDetailsSceneView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "products", variant: "check-stock")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.title

        self.createRefreshBarButton()
        self.createDismissBarButton()
    }

    private func createRefreshBarButton() {
        self.setRightBarButtonItem(NavigationButton(title: .image(.styledImage(identifier: "icon-retry")), action: self.viewModel.onRefresh))
    }

    private func createDismissBarButton() {
        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarDoneButtonTitle), action: self.viewModel.onDismiss))
    }
}
