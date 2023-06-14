// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

/// The view controller that hosts the client list form.
/// Its main purpose is to allow creation and editing of a client list.
final class ClientListFormViewController: StylableViewController<ClientListFormView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("client-list.navigationBar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancel the client list creation/edition")
        static let navigationBarSaveButtonTitle = MKLocalizedString("client-list.navigationBar.trailing.save",
                                                                    comment: "Title for the save button in the client list navigation bar")
    }

    private var cancellables = Set<AnyCancellable>()

    var viewModel: ClientListFormViewModel! {
        didSet {
            self.childView = ClientListFormView(clientListFormViewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "mylist")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createCloseButton()
        self.createSaveButton()
        self.viewModel.fetchListContentIfNecessary()
        self.title = self.viewModel.title
    }

    private func createCloseButton() {
        self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle), action: self.viewModel.didTapClose))
    }

    private func createSaveButton() {
        self.viewModel.$isValidForm.sink { [weak self] isValid in
            guard let self = self else { return }
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarSaveButtonTitle), isEnabled: isValid, action: self.viewModel.saveList))
        }.store(in: &self.cancellables)
        self.viewModel.$isSavingList.sink { [weak self] isSavingList in
            guard let self = self else { return }
            if isSavingList {
                self.setRightBarButtonItem(.loading)
            } else {
                self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarSaveButtonTitle),
                                                            isEnabled: self.viewModel.isValidForm,
                                                            action: self.viewModel.saveList))
            }
        }.store(in: &self.cancellables)
    }

    @objc private func didTapSaveButton() {
        self.viewModel.saveList()
    }
}
