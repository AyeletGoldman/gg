// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

/// The view controller that hosts the array of client lists
/// Its main purpose is to show all types of client lists: campaign, featured, personal...
final class SearchClientsViewController: StylableViewController<SearchClientsSceneView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("clients.search.navigationBar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancel the client search")
        static let navigationBarDoneButtonTitle = MKLocalizedString("clients.search.navigationBar.trailing.done",
                                                                    comment: "Title for the done button in the client search navigation bar")
        static let navigationBarSearchClientsPlaceholder = MKLocalizedString("clients.search.navigationBar.search.placeholder",
                                                                    comment: "Placeholder for the search bar while searching for clients")
    }

    var viewModel: SearchClientsViewModel! {
        didSet {
            self.childView = SearchClientsSceneView(viewModel: self.viewModel)
        }
    }

    var searchController: MKSearchController? {
        didSet {
            self.searchController?.searchBarPlaceholder = Labels.navigationBarSearchClientsPlaceholder
            self.searchController?.obscuresBackgroundDuringPresentation = false
            self.searchController?.hidesNavigationBarDuringPresentation = false
            self.searchController?.automaticallyShowsCancelButton = false
            self.searchController?.searchResultsUpdater = self
            self.navigationItem.searchController = self.searchController
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "search")
    }

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.viewModel.title

        if let onDismiss = self.viewModel.onDismiss {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle), action: onDismiss))
        }
        if self.viewModel.shouldShowDoneButton {
            self.setRightBarButtonItem(NavigationButton(title: .text(Labels.navigationBarDoneButtonTitle), action: self.viewModel.didTapDone))
        }

        self.searchController?.isPresentedInModalContext = self.isModal
        self.searchController?.styleSearchBar()
        self.monitorSearchText()
    }
}

extension SearchClientsViewController: UISearchResultsUpdating {
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
