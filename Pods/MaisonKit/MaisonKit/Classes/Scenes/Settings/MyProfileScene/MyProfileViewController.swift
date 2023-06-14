// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class MyProfileViewController: StylableViewController<MyProfileView> {

    private enum Labels {
        static let navigationBarTitle = MKLocalizedString("settings.profile.navigationBar.title",
                                                          comment: "Title for 'My profile' screen in settings")
    }

    var viewModel: MyProfileViewModel! {
        didSet {
            self.childView = MyProfileView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return "settings"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.navigationBarTitle
    }
}
