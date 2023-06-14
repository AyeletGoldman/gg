// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

final class ConfirmAppointmentViewController: StylableViewController<ConfirmAppointmentView> {

    private var cancellables = Set<AnyCancellable>()

    var viewModel: ConfirmAppointmentViewModel! {
        didSet {
            self.childView = ConfirmAppointmentView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.actionType.pageTitle
    }
}
