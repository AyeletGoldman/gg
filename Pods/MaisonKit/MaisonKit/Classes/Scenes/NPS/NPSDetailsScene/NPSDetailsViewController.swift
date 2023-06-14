//  Copyright © 2022 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class NPSDetailsViewController: StylableViewController<NPSDetailsView> {

    private enum Labels {
        static let clientDetails = MKLocalizedString("nps.details.navigation-bar.title",
                                                     comment: "The title for the NPS details screen")
    }

    var viewModel: NPSDetailsViewModel! {
        didSet {
            self.childView = NPSDetailsView(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "profile")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = Labels.clientDetails

        self.viewModel.fetchNPSDetails()
    }
}
