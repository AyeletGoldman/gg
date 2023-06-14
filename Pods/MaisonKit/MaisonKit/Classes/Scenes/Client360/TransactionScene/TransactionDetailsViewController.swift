// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

final class TransactionDetailsViewController: StylableViewController<TransactionDetailsView> {

    private enum Labels {
        static let title = MKLocalizedString("client360.transactions.title", comment: "Title for the transactions screen")
        static let closeButtonTitle = MKLocalizedString("client360.transactions.navigation-bar.leading.close", comment: "The title of the close button in the navigation bar")
    }

    var viewModel: TransactionDetailsViewModel! {
        didSet {
            self.childView = TransactionDetailsView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "profile")
    }

    var onClose: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchTransaction()
        self.viewModel.logViewAnalytics()

        self.title = Labels.title

        if let onClose {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.closeButtonTitle), action: onClose))
        }
    }
}
