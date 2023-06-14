// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI
import Combine

final class EditAppointmentViewController: StylableViewController<EditAppointmentView> {

    private enum Labels {
        static let title = MKLocalizedString("edit-appointment.navigationBar.title",
                                             comment: "Title for edit appointment navigation bar")
    }

    var viewModel: EditAppointmentViewModel! {
        didSet {
            self.childView = EditAppointmentView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title
    }
}
