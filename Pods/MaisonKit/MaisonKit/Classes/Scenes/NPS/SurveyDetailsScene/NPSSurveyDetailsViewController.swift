//  Copyright © 2022 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

final class NPSSurveyDetailsViewController: StylableViewController<NPSSurveyDetailsView> {

    private enum Labels {
        static let title = MKLocalizedString("nps.survey-details.title",
                                             comment: "The title for the survey answer details screen")
    }

    var viewModel: NPSSurveyDetailsViewModel! {
        didSet {
            self.childView = NPSSurveyDetailsView(viewModel: viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "profile")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchSurveyDetails()
        self.title = Labels.title
    }
}
