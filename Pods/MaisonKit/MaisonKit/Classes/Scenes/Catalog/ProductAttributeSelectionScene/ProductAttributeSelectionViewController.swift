// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class ProductAttributeSelectionViewController: StylableViewController<ProductAttributeSelectionView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("product-details.attributes.selection.cancel.title",
                                                                      comment: "Title for the navigation bar button that cancel the product attribute selection")
        static let navigationBarDoneButtonTitle = MKLocalizedString("product-details.attributes.selection.done.title",
                                                                    comment: "The text to show for the done button when selecting an attribute in product details")
    }

    override var stylistSection: String? {
        return "products"
    }

    var viewModel: ProductAttributeSelectionViewModel! {
        didSet {
            self.childView = ProductAttributeSelectionView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.title

        self.addNavigationItemsIfNeeded()
    }

    private func addNavigationItemsIfNeeded() {
        if let onDone = self.viewModel.onDone {
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarDoneButtonTitle),
                                                        action: {
                onDone(self.viewModel.selectedAttributeItemId)
            }))
        }

        if let onCancel = self.viewModel.onCancel {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle),
                                                       action: onCancel))
        }
    }
}
