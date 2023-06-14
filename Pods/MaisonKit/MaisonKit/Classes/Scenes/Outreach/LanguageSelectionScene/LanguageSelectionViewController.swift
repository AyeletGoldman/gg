// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class LanguageSelectionViewController: StylableViewController<LanguageSelectionView> {

    private enum Labels {
        static let navigationBarTitle = MKLocalizedString("outreach.languages.navigationBar.title",
                                                          comment: "Title for the 'Select language' screen in outreach")
    }

    var viewModel: LanguageSelectionViewModel! {
        didSet {
            self.childView = LanguageSelectionView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "outreach")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.navigationBarTitle
    }
}
