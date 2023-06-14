//  Copyright © 2022 LVMH. All rights reserved.

import UIKit
import Combine

final class TimelineClientEventViewController: StylableViewController<TimelineClientEventView> {

    private enum Labels {
        static let cancelButtonTitle = MKLocalizedString("timeline-client-event.navigation-bar.leading.cancel",
                                                         comment: "The title of the cancel button in timeline client event")
        static let saveButtonTitle = MKLocalizedString("timeline-client-event.navigation-bar.trailing.save",
                                                       comment: "The title of the save button when creating/editing a timeline client event")
        static let editButtonTitle = MKLocalizedString("timeline-client-event.navigation-bar.trailing.edit",
                                                       comment: "The title of the edit button in timeline client event with read mode")
    }

    private var cancellables = Set<AnyCancellable>()

    var viewModel: TimelineClientEventViewModel! {
        didSet {
            self.childView = TimelineClientEventView(viewModel: self.viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchEventFields()
        self.title = self.viewModel.pageTitle

        self.addNavigationItems()
    }

    private func addNavigationItems() {
        if let onDismiss = self.viewModel.onDismiss {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.cancelButtonTitle),
                                                       action: onDismiss))
        }
        switch self.viewModel.mode {
        case .create, .edit:
            self.createSaveButton()
        case .read(_, let allowEdit, _):
            if allowEdit {
                self.createEditButton()
            }
        }
    }

    private func createSaveButton() {
        self.viewModel.$isSaving.combineLatest(self.viewModel.$isValidForm, self.viewModel.$isDeleting)
            .sink { [weak self] (isSaving, isValid, isDeleting) in
                guard let self = self else { return }
                if isSaving {
                    self.setRightBarButtonItem(.loading)
                } else {
                    self.setRightBarButtonItem(NavigationButton(title: .text(Labels.saveButtonTitle),
                                                                isEnabled: isValid && !isDeleting,
                                                                action: self.viewModel.didTapSave))
                }
            }.store(in: &self.cancellables)
    }

    private func createEditButton() {
        self.viewModel.$isDeleted
            .sink { [weak self] isDeleted in
                guard let self = self else { return }
                if !isDeleted {
                    self.setRightBarButtonItem(NavigationButton(title: .text(Labels.editButtonTitle),
                                                                action: self.viewModel.didTapEdit))
                } else {
                    self.setRightBarButtonItems([])
                }
            }.store(in: &self.cancellables)
    }
}
