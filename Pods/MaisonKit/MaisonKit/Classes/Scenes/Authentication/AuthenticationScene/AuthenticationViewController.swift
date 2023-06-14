// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine
import StylableSwiftUI

final class AuthenticationViewController: StylableViewController<AuthenticationView> {

    var viewModel: AuthenticationViewModel! {
        didSet {
            self.childView = AuthenticationView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return "login"
    }
}
