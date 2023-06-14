//  Copyright © 2022 LVMH. All rights reserved.

import UIKit

final class BarcodeScannerViewController: StylableViewController<BarcodeScannerView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("barcode-scanner.navigationBar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancels the barcode scanning")
    }

    var viewModel: BarcodeScannerViewModel! {
        didSet {
            self.childView = BarcodeScannerView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle), action: {
            self.viewModel.didTapCancel()
        }))

        // TODO: remove this when the theme has been updated
        self.changeNavigationBarColor(to: .clear)
    }
}
