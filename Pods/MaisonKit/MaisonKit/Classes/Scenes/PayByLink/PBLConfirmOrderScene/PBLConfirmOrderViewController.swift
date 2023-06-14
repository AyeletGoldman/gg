//  Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class PBLConfirmOrderViewController: StylableViewController<PBLConfirmOrderView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("pay-by-link.confirm-order.navigation-bar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancel the pay-by-link")
    }

    var viewModel: PBLConfirmOrderViewModel! {
        didSet {
            self.childView = PBLConfirmOrderView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "products", variant: "pay-by-link")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchOrderDetails()

        self.navigationController?.presentationController?.delegate = self
        self.title = self.viewModel.title
        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle),
                                                       action: self.viewModel.didTapClose))
    }
}

// Extension used to manage user pull down to dismiss
extension PBLConfirmOrderViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return false // Prevents the modal sheet from being closed
    }

    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        self.viewModel.didTapClose()
    }
}
