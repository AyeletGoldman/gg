// Copyright © 2022 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

final class ShareDataViewController: StylableViewController<ShareDataView> {

    private enum Labels {
        static let navigationBarCancelButtonTitle = MKLocalizedString("share-data.navigationBar.leading.cancel",
                                                                      comment: "Title for the navigation bar button that cancel the share data screen")
        static let navigationBarSearchClientsPlaceholder = MKLocalizedString("share-data.navigationBar.client-searchbar.placeholder",
                                                                      comment: "Placeholder for searching clients in the share data screen")
    }

    var viewModel: ShareDataViewModel! {
        didSet {
            self.childView = ShareDataView(viewModel: self.viewModel)
        }
    }

    var searchController: MKSearchController? {
        didSet {
            self.searchController?.searchBarPlaceholder = Labels.navigationBarSearchClientsPlaceholder
            self.searchController?.obscuresBackgroundDuringPresentation = false
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
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.navigationBarCancelButtonTitle),
                                                       action: onDismiss))
        }

        self.searchController?.isPresentedInModalContext = self.isModal
        self.searchController?.styleSearchBar()
        self.monitorSearchText()
    }
}

extension ShareDataViewController: UISearchResultsUpdating {
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
