// Copyright © 2021 LVMH. All rights reserved.

import UIKit
import Combine
import StylableSwiftUI

final class Client360ViewController: StylableViewController<Client360View> {

    private enum Labels {
        static let closeButtonTitle = MKLocalizedString("client360.navigation-bar.close.title",
                                                        comment: "Title of close button in navigation bar")
    }

    var viewModel: Client360ViewModel! {
        didSet {
            self.childView = Client360View(viewModel: self.viewModel)
        }
    }

    override var stylistSection: String? {
        return StylistIdentifier.buildFullIdentifier(for: "clients", variant: "profile")
    }

    private var cancellables = Set<AnyCancellable>()
    var onClose: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the appearance for the refresh control in pull-to-refresh
        // TODO: We should be able to remove this when we drop iOS 15, by using the List's `scrollContentBackground(_:)`
        self.setSpinnerAppearance()
        self.stylist.$currentTheme
            .receive(on: DispatchQueue.main) // required to make sure the the `stylist` has the correct theme set.
            .sink { [weak self] _ in
                self?.setSpinnerAppearance()
        }.store(in: &self.cancellables)
        // END TODO

        self.buildRightBarButtonItems()
        self.configureBackButton()

        if let image = self.stylist.uiImage(for: "navbar-profile/button-icon-left/icon-left") {
            self.changeBackButtonImage(to: image)
        }

        self.viewModel.fetchClientData()
        self.viewModel.logViewAnalytics()

        self.viewModel.$title
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] title in
                guard let self = self else { return }
                self.navigationItem.setCustomViewNavigationBarTitle(title,
                                                                    stylistGroup: "navbar-profile",
                                                                    stylist: self.stylist)
            }.store(in: &self.cancellables)

        // We have a closure to invoke so we add a close button
        if let onClose = self.onClose {
            self.setLeftBarButtonItem(NavigationButton(title: .text(Labels.closeButtonTitle),
                                                       action: onClose))
        }
    }

    private func setSpinnerAppearance() {
        let appearance = UIRefreshControl.appearance(whenContainedInInstancesOf: [ListAppearance.appearanceContainer, Client360ViewController.self])
        appearance.tintColor = self.styleContainer.backgroundColor(for: "navbar-profile/spinner/background")
    }

    private func buildRightBarButtonItems() {
        Publishers.CombineLatest(self.viewModel.$availableNavigationBarActions, self.stylist.$currentTheme)
            .receive(on: DispatchQueue.main) // required to make sure the the `stylist` has the correct theme set.
            .sink { [weak self] actions, _ in
                guard let self = self else { return }
                self.addMenuItemsBarButtonIfNeeded(actions: actions,
                                                   imageIdentifier: "navbar-profile/icon-more",
                                                   handleActionTypeAction: self.viewModel.handleActionTypeAction)
        }.store(in: &self.cancellables)
    }

    private func configureBackButton() {
        let attributes = MaisonKitAppearance.getTextAttributes(for: "navbar-profile/button-icon-left/title", in: self.styleContainer)
        self.setBackButtonTitleAttributes(attributes)
    }
}
