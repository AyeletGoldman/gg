// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class InstructionsViewController: StylableViewController<InstructionsSceneView> {

    private enum Labels {
        static let navigationBarTitle = MKLocalizedString("outreach.instructions.navigation-bar.title",
                                                          comment: "The navigation bar title of the outreach instructions scene")
    }

    var viewModel: InstructionsViewModel! {
        didSet {
            self.childView = InstructionsSceneView(viewModel: self.viewModel)
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
