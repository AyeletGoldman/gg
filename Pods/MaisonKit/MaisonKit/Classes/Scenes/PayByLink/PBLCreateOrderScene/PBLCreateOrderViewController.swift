// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

public final class PBLCreateOrderViewController: StylableViewController<PBLCreateOrderView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("pay-by-link.create-order.navigation-bar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancel the pay-by-link")
    }

    var viewModel: PBLCreateOrderViewModel! {
        didSet {
            self.childView = PBLCreateOrderView(viewModel: self.viewModel)
        }
    }

    override public var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "products", variant: "pay-by-link")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.viewModel.title

        if let onClose = self.viewModel.onClose {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle),
                                                       action: onClose))
        }
    }
}
