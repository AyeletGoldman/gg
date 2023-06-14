// Copyright © 2023 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class CreateClientViewController: StylableViewController<CreateClientView> {

    var viewModel: CreateClientViewModel! {
        didSet {
            self.childView = CreateClientView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel.setupGuidedAccess(true)
    }

    override var isModalInPresentation: Bool {
        get { UIAccessibility.isGuidedAccessEnabled }
        set { }
    }
}
