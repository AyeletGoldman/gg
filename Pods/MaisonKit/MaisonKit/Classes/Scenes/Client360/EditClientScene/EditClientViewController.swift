//  Copyright © 2022 LVMH. All rights reserved.

import UIKit
import Combine

final class EditClientViewController: StylableViewController<GenericFormView<AnyFormData>> {

    private enum Labels {
        static let title = MKLocalizedString("clients.edit-client.navigation-bar.title",
                                             comment: "The title of the screen to edit a client")
        static let cancelButtonTitle = MKLocalizedString("clients.edit-client.navigation-bar.leading.cancel",
                                                         comment: "The title of the cancel editing a client's profile")
        static let nextButtonTitle = MKLocalizedString("clients.edit-client.navigation-bar.trailing.next",
                                                       comment: "The title of the save button when editing a client's profile")
    }

    private var cancellables = Set<AnyCancellable>()

    var viewModel: EditClientViewModel! {
        didSet {
            self.childView = GenericFormView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchClientFields()
        self.title = Labels.title

        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.cancelButtonTitle), action: self.viewModel.didTapCancel))
        self.createSaveButton()
    }

    private func createSaveButton() {
        self.viewModel.$isSaving.combineLatest(self.viewModel.$isValidForm)
            .sink { [weak self] (isSaving, isValid) in
                guard let self = self else { return }
                if isSaving {
                    self.setRightBarButtonItem(.loading)
                } else {
                    self.setRightBarButtonItem(NavigationButton(title: .text(Labels.nextButtonTitle),
                                                                isEnabled: isValid,
                                                                action: self.viewModel.didTapNext))
                }
            }.store(in: &self.cancellables)
    }
}
