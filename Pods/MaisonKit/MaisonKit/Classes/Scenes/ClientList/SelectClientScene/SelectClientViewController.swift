//  Copyright © 2022 LVMH. All rights reserved.

import UIKit
import Combine

final class SelectClientViewController: StylableViewController<SelectClientView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("clients.search.navigationBar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancel the client search")
        static let navigationBarDoneButtonTitle = MKLocalizedString("clients.search.navigationBar.trailing.done",
                                                                    comment: "Title for the done button in the client search navigation bar")
        static let navigationBarSearchClientsPlaceholder = MKLocalizedString("client-lists.navigation-bar.search.placeholder.title",
                                                                      comment: "The title of the placeholder for searching clients globally")
    }

    private var cancellables = Set<AnyCancellable>()

    var viewModel: SelectClientViewModel! {
        didSet {
            self.childView = SelectClientView(viewModel: self.viewModel)
        }
    }

    // This variable is used to override the `stylistSection` because the section
    // for the stylist for this controller is passed in via the scene
    // swiftlint:disable:next identifier_name
    var _stylistSection: String?
    override var stylistSection: String? {
        return self._stylistSection
    }

    var searchController: MKSearchController? {
        didSet {
            self.searchController?.searchBarPlaceholder = Labels.navigationBarSearchClientsPlaceholder
            self.searchController?.obscuresBackgroundDuringPresentation = false
            self.searchController?.searchResultsUpdater = self
            self.searchController?.automaticallyShowsCancelButton = false
            self.searchController?.hidesNavigationBarDuringPresentation = false
            self.navigationItem.searchController = self.searchController
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.viewModel.title

        if let onDismiss = self.viewModel.onDismiss {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle), action: onDismiss))
        }
        self.createDoneButton()
        self.searchController?.isPresentedInModalContext = self.isModal
        self.searchController?.styleSearchBar()
        self.monitorSearchText()
    }

    private func createDoneButton() {
        self.viewModel.$enableDoneButton.sink { [weak self] isEnabled in
            guard let self = self else { return }
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarDoneButtonTitle),
                                                        isEnabled: isEnabled,
                                                        action: self.viewModel.didTapDone))
        }.store(in: &self.cancellables)
    }
}

extension SelectClientViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.viewModel.searchText = searchController.searchBar.text ?? ""
    }

    func monitorSearchText() {
        self.viewModel.$searchText.sink { [weak self] text in
            guard let parent = self?.searchController ?? self?.parent as? MKSearchController else { return }
            guard text != parent.searchBar.text else { return }
            parent.searchBar.text = text
        }.store(in: &self.cancellables)
    }
}
