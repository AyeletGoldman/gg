//  Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class PBLCopyLinkViewController: StylableViewController<PBLCopyLinkView> {

    private enum Labels {
        static let title = MKLocalizedString("pay-by-link.copy.navigation-bar.title",
                                             comment: "The title in the navigation bar for the copy view in pay by link")
        static let doneButtonTitle = MKLocalizedString("pay-by-link.copy.navigation-bar.done-button.title",
                                                       comment: "The title in the navigation bar for done button in pay by link")
    }

    var viewModel: PBLCopyLinkViewModel! {
        didSet {
            self.childView = PBLCopyLinkView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "products", variant: "pay-by-link")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title

        self.viewModel.fetchOrderData()
        
        self.setRightBarButtonItem(NavigationButton(title: .text(Labels.doneButtonTitle), action: self.viewModel.didTapDone))
    }
}
