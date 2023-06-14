//  Copyright © 2021 LVMH. All rights reserved.

import UIKit

final class ThemeViewController: StylableViewController<ThemeView> {

    private enum Labels {
        static let title = MKLocalizedString("theme.navigation-bar.title",
                                             comment: "Title in navigation bar for theme selection")
    }

    var viewModel: ThemeViewModel! {
        didSet {
            self.childView = ThemeView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return "settings"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title
    }
}
