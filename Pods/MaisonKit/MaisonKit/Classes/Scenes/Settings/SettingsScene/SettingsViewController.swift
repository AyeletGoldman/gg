// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class SettingsViewController: TabBarRootViewController<SettingsView> {

    private enum Labels {
        static let navigationBarTitle = MKLocalizedString("settings.navigationBar.title",
                                                          comment: "Title for 'Settings' screen")
    }

    var viewModel: SettingsViewModel! {
        didSet {
            self.childView = SettingsView(viewModel: self.viewModel)
        }
    }

    override var tabBarImageIcon: String { return "icon-settings" }
    override var tabBarTitle: String { return MKLocalizedString("tab.settings.title", comment: "The tab icon title for Settings") }

    override var stylistSection: String? {
        return "settings"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.navigationBarTitle
        self.viewModel.fetchAdditionalSettingsActions()
    }
}
