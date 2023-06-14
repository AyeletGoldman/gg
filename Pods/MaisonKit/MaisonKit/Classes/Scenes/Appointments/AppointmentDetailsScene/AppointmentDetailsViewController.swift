// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

final class AppointmentDetailsViewController: StylableViewController<AppointmentDetailsView> {

    private enum Labels {
        static let title = MKLocalizedString("appointment-details.navigationBar.title",
                                             comment: "Title for appointment details navigation bar")
        static let editButtonTitle = MKLocalizedString("appointment-details.navigationBar.edit-button.title",
                                                       comment: "Title for appointment details edit button in the navigation bar")
    }

    private var cancellables = Set<AnyCancellable>()

    var viewModel: AppointmentDetailsViewModel! {
        didSet {
            self.childView = AppointmentDetailsView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title

        self.createEditButton()
        self.viewModel.fetchAppointment()
    }

    private func createEditButton() {
        self.viewModel.$displayable
            .receive(on: DispatchQueue.main)
            .sink { [weak self] displayable in
                guard let self = self else { return }
                if displayable.value?.isEditable == true, !self.viewModel.isCancelled {
                    self.setRightBarButtonItem(NavigationButton(title: .image(.styledImage(identifier: "icon-trash")),
                                                                action: self.viewModel.presentCancelAppointment))
                } else {
                    self.setRightBarButtonItems([])
                }
            }.store(in: &self.cancellables)
    }
}
