// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

final class BookAppointmentViewController: StylableViewController<GenericFormView<BookAppointmentFormData>> {

    private enum Labels {
        static let title = MKLocalizedString("book-appointment.navigationBar.title",
                                             comment: "Title for book an appointment navigation bar")
        static let cancelButtonTitle = MKLocalizedString("book-appointment.navigationBar.leading.cancel",
                                                         comment: "Title for the navigation bar button that cancel book an appointment form")
        static let nextButtonTitle = MKLocalizedString("book-appointment.navigationBar.trailing.next",
                                                       comment: "Title for the next button in book an appointment navigation bar")
    }

    private var cancellables = Set<AnyCancellable>()

    var viewModel: BookAppointmentViewModel! {
        didSet {
            self.childView = GenericFormView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Labels.title

        self.createCloseButton()
        self.createSaveButton()
    }

    private func createCloseButton() {
        if self.isModal {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.cancelButtonTitle), action: self.viewModel.didTapClose))
        }
    }

    private func createSaveButton() {
        self.viewModel.$isValidForm.sink { [weak self] isValid in
            guard let self = self else { return }
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.nextButtonTitle), isEnabled: isValid, action: self.viewModel.didTapNext))
        }.store(in: &self.cancellables)
    }
}
