// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag
import SwiftUI

/// View model for the `SettingsView`
/// Is responsible of the logout of the user, the modification of the language, and the profile display
final class SettingsViewModel: ObservableObject {

    private enum Labels {
        static let logoutAlertCancelButtonTitle = MKLocalizedString("settings.logout.alert.button.cancel.title",
                                                                    comment: "Cancel button title for alert asking user to confirm they want to log out")
        static let logoutAlertConfirmButtonTitle = MKLocalizedString("settings.logout.alert.button.confirm.title",
                                                                     comment: "Button title for alert asking user to confirm they want to log out")
        static let logoutAlertTitle = MKLocalizedString("settings.logout.alert.title",
                                                        comment: "Title for alert asking user to confirm they want to log out")
        static let logoutAlertMessage = MKLocalizedString("settings.logout.alert.message",
                                                          comment: "Message for alert asking user to confirm they want to log out")
    }

    @Published var alertContext: AlertContext?
    @Published private(set) var currentlySelectedTheme: ThemeDisplayable.Theme?
    @Published private(set) var additionalActions: ResultState<[SettingsCell], ErrorDisplayable> = .waiting

    private let urlOpener: URLOpener
    private let router: SettingsRouter

    @Inject private var adapter: SettingsAdapter

    private var cancellables = Set<AnyCancellable>()

    private var themes: [ThemeDisplayable.Theme] = []

    var hasThemeSupport: Bool {
        return !self.themes.isEmpty
    }

    /// Creates a new `SettingsViewModel` given an `URLOpener` and a router
    /// - Parameters:
    ///   - urlOpener: Instance of `URLOpener` responsible of the opening of the settings app
    ///   - router: `SettingsRouter` instance used for the routing handling of the scene
    init(urlOpener: URLOpener = UIApplication.shared, router: SettingsRouter) {
        self.urlOpener = urlOpener
        self.router = router
        let themeDisplayable = self.adapter.fetchAvailableThemes()
        self.themes = themeDisplayable.availableThemes
        self.currentlySelectedTheme = themeDisplayable.availableThemes.first(where: { theme in
            theme.identifier == themeDisplayable.selectedThemeIdentifier
        })
    }

    /// We don't want to show the Languages button if we have
    /// only one language available.
    var shouldShowLanguagesAction: Bool {
        // Don't count the "Base" default language.
        let localizationsWithoutBase = Bundle.main
            .localizations
            .filter { $0 != "Base" }

        return localizationsWithoutBase.count > 1
    }

    func logout() {
        let cancelButton = AlertContext.Button(title: Labels.logoutAlertCancelButtonTitle,
                                               style: .cancel(action: nil))
        let logoutButton = AlertContext.Button(title: Labels.logoutAlertConfirmButtonTitle,
                                               style: .destructive(action: {
                                                MaisonKit.logout()
                                                Analytics.log(LogoutEvent())
                                               }))
        self.alertContext = AlertContext(title: Labels.logoutAlertTitle,
                                         message: Labels.logoutAlertMessage,
                                         primaryButton: cancelButton,
                                         secondaryButton: logoutButton)
    }

    func didTapLanguagesButton() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
              self.urlOpener.canOpenURL(url) else {
            return
        }
        self.urlOpener.open(url, options: [:], completionHandler: nil)
    }

    func didTapMyProfileButton() {
        self.router.presentMyProfile()
    }

    func didTapThemesButton() {
        guard let currentlySelectedTheme = self.currentlySelectedTheme else { return }
        self.router.presentThemes(themes: ThemeDisplayable(availableThemes: self.themes,
                                                           selectedThemeIdentifier: currentlySelectedTheme.identifier)) { [weak self] newTheme in
            // Tell adapter
            self?.currentlySelectedTheme = self?.themes.first(where: { $0.identifier == newTheme })
            self?.currentlySelectedTheme?.onSelect()
            self?.adapter.didSelectTheme(identifier: newTheme)
            // Fire notification
            NotificationCenter.default.post(name: .themeDidChangeNotification, object: nil)
        }
    }

    func fetchAdditionalSettingsActions() {
        self.adapter.additionalSettingsActions()
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.additionalActions = .loading([.loadingSettingsAction])
            })
            .map(ResultState.fromResult)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.additionalActions = .failed(ErrorDisplayable(error))
                case .finished:
                    break
                }
            } receiveValue: { [weak self] result in
                self?.additionalActions = result
            }.store(in: &self.cancellables)
    }
}

extension SettingsViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter { self.router }
}

private extension SettingsCell {
    static var loadingSettingsAction: SettingsCell {
        return SettingsCell(displayable: SettingsActionDisplayable(title: "Loading action",
                                                                   subtitle: "Some subtitle",
                                                                   icon: nil,
                                                                   axis: .horizontal),
                            action: nil)
    }
}

#if DEBUG
extension SettingsViewModel {
    func didTapShowFlags() {
        self.router.presentFeatureFlags()
    }
}
#endif
