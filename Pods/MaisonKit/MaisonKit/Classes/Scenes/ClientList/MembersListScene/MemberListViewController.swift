// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

/// The view controller that hosts the member lists
/// Its main purpose is to show all members in a given list
final class MemberListViewController: StylableViewController<ClientListMembersView> {

    private enum Labels {
        static let searchBarPlaceholder = MKLocalizedString("client-list.members.search.placeholder",
                                                            comment: "Title of the search bar placeholder in client lists when searching a specific member's list.")
    }

    var viewModel: MemberListViewModel! {
        didSet {
            self.childView = ClientListMembersView(viewModel: self.viewModel)
        }
    }

    var searchController: MKSearchController? {
        didSet {
            self.searchController?.searchBarPlaceholder = Labels.searchBarPlaceholder
            self.overrideSearchResultsControllerBackground()
            self.navigationItem.searchController = self.searchController
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: self.viewModel.isEditable ? "mylist" : "featured")
    }

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.listenToListName()
        self.buildRightBarButtonItems()
        self.configureBackButton()
        self.configureNavigationBarColor()
        self.viewModel.fetchClientListMembers()
        self.viewModel.logViewAnalytics()

        self.stylist.$currentTheme.receive(on: DispatchQueue.main).sink { [weak self] _ in
            self?.configureNavigationBarColor()
            self?.overrideSearchResultsControllerBackground()
        }.store(in: &self.cancellables)

        self.viewModel.$dataSource.compactMap { [weak self] state -> ClientListDisplayable.ListInfo? in
            return self?.extractBackgroundListInfo(from: state.value)
        }.sink(receiveValue: { [weak self] listInfo in
            self?.changeNavigationBarColorIfNeeded(for: listInfo)
            self?.styleSearchController(asImage: listInfo.backgroundImage == nil)
        }).store(in: &self.cancellables)
    }

    private func overrideSearchResultsControllerBackground() {
        // We don't want this controller to override the navigation color of the backgrond image, so we disable its
        // background color. We want the color to be transparent in this case so we can see the background image in featured lists.
        self.searchController?.searchResultsController?.view.backgroundColor = .clear
    }

    private func extractBackgroundListInfo(from state: ClientListMemberState?) -> ClientListDisplayable.ListInfo? {
        switch state {
        case .error(let info, _), .partial(let info):
            return info
        case .total(let displayable):
            return displayable.listInfo
        default:
            return nil
        }
    }

    private func changeNavigationBarColorIfNeeded(for listInfo: ClientListDisplayable.ListInfo?) {
        guard listInfo?.backgroundImage != nil else { return }

        self.changeNavigationBarColor(to: .clear)
    }

    private func configureNavigationBarColor() {
        let listInfo = self.extractBackgroundListInfo(from: self.viewModel.dataSource.value)
        self.changeNavigationBarColorIfNeeded(for: listInfo)
        self.styleSearchController(asImage: listInfo?.backgroundImage == nil)
    }

    private func styleSearchController(asImage: Bool) {
        self.searchController?.navBarVariant = asImage ? nil : "image"
        self.searchController?.isPresentedInModalContext = self.isModal
        self.searchController?.styleSearchBar()
    }

    private func listenToListName() {
        self.viewModel.$listName
            .weakAssign(to: \.title, on: self)
            .store(in: &self.cancellables)
    }

    private func buildRightBarButtonItems() {
        self.viewModel.$isEditable
            .filter { $0 }
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.setRightBarButtonItems([
                    NavigationButton(title: .image(.styledImage(identifier: "navbar-list/icon-edit")),
                                     action: self.viewModel.presentEditScreen)
                ])
        }.store(in: &self.cancellables)
    }

    private func configureBackButton() {
        let attributes = MaisonKitAppearance.getTextAttributes(for: "navbar-list/button-icon-left/title", in: self.styleContainer)
        self.setBackButtonTitleAttributes(attributes)
    }
}
