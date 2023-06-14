//  Copyright © 2023 LVMH. All rights reserved.

import UIKit

final class EditClientConfirmationViewController: StylableViewController<EditClientConfirmationView> {

    private enum Labels {
        static let title = MKLocalizedString("clients.edit-client.confirmation.navigation-bar.title",
                                             comment: "The title for the screen that shows a summary of changes to a client's record before confirming them and saving them")
    }

    var viewModel: EditClientConfirmationViewModel! {
        didSet {
            self.childView = EditClientConfirmationView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = Labels.title

        self.viewModel.fetchConfirmationData()
    }
}
