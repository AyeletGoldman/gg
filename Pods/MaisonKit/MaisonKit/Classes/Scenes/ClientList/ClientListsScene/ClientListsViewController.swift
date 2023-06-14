// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI
import Combine

/// The view controller that hosts the array of client lists
/// Its main purpose is to show all types of client lists: campaign, featured, personal...
final class ClientListsViewController: TabBarRootViewController<MainClientListView> {

    private enum Labels {
        static let title = MKLocalizedString("client-lists.navigationBar.title",
                                             comment: "The title of the client lists screen")
        static let searchPlaceholder = MKLocalizedString("client-lists.navigation-bar.search.placeholder.title",
                                                         comment: "The title of the placeholder for searching clients globally")
    }

    var viewModel: MainClientListViewModel! {
        didSet {
            self.childView = MainClientListView(viewModel: self.viewModel)
        }
    }

    var searchController: MKSearchController? {
        didSet {
            self.searchController?.searchBarPlaceholder = Labels.searchPlaceholder
            self.navigationItem.searchController = self.searchController
        }
    }

    override var stylistSection: String? {
        return  "clients"
    }

    override var tabBarImageIcon: String { return "icon-clients" }
    override var tabBarTitle: String { return MKLocalizedString("tab.clients.title", comment: "The tab icon title for Clients") }

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchClientLists()
        self.title = Labels.title
        self.searchController?.isPresentedInModalContext = self.isModal
        self.searchController?.styleSearchBar()
        self.buildRightBarButtonItems()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewModel.isEditingPersonalLists = false
    }

    private func buildRightBarButtonItems() {
        if Features.manager.isEnabled(.createClient, defaultValue: false) {
            self.addRightBarButtonItem(NavigationButton(title: .image(.styledImage(identifier: "icon-add-client")),
                                                        action: self.viewModel.didTapCreateClient))
        } else {
            Publishers.CombineLatest(self.viewModel.$availableNavigationBarActions, self.stylist.$currentTheme)
                .receive(on: DispatchQueue.main) // required to make sure the the `stylist` has the correct theme set.
                .sink { [weak self] actions, _ in
                    guard let self = self else { return }
                    self.addMenuItemsBarButtonIfNeeded(actions: actions, handleActionTypeAction: self.viewModel.handleActionTypeAction)
                }.store(in: &self.cancellables)
        }
    }
}
