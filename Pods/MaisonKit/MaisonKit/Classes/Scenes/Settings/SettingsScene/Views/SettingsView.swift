// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that shows a link to the profile, the language settings and the logout
struct SettingsView: View {

    private enum Constants {
        static let buttonSize = CGSize(width: 16, height: 16)
    }

    private enum Labels {
        static let logoutActionTitle = MKLocalizedString("settings.actions.logout.title",
                                                         comment: "Title for 'logout' button in settings")
        static let myProfileActionTitle = MKLocalizedString("settings.actions.my-profile.title",
                                                            comment: "Title for 'My profile' button in settings")
        static let languagesActionTitle = MKLocalizedString("settings.actions.languages.title",
                                                            comment: "Title for 'Languages' button in settings")
        static let themesActionTitle = MKLocalizedString("settings.actions.themes.title",
                                                         comment: "Title for 'Themes' button in settings")
    }

    @ObservedObject private var viewModel: SettingsViewModel

    /// Creates a new `SettingsView`.
    /// - Parameter viewModel: a `SettingsViewModel` that will handle the display and the interactions with the view.
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }

    /// The main body of the `SettingsView`.
    public var body: some View {
        StylableGroup("settings") {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 0) {
                        StylableGroup("list") {
                            self.buildMyProfileLink()
                                .styleAsListRow(includeDivider: true)
                            if self.viewModel.shouldShowLanguagesAction {
                                self.buildLanguagesLink()
                                    .styleAsListRow(includeDivider: true)
                            }
                            self.buildThemesLinkIfNecessary()
                                .styleAsListRow(includeDivider: true)
#if DEBUG
                            self.buildShowFlags()
                                .styleAsListRow(includeDivider: true)
#endif
                            ResultStateViewBuilder(result: self.viewModel.additionalActions)
                                .setLoadingView { actions in
                                    if let actions = actions {
                                        self.buildAdditionalActionsList(actions)
                                    }
                                }.setWaitingView { EmptyView() }
                                .buildContent { actions in
                                    self.buildAdditionalActionsList(actions)
                                }
                        }
                    }.padding(.top)
                }
                self.buildLogoutButton()
                    .addStyledRowDivider(position: .top)
                    .styleAsListRow(variant: "highlighted", includeDivider: true)
                AppVersionView(textStyle: "subtitle")
                    .padding()
            }
        }.style("background")
            .alert(alertContext: self.$viewModel.alertContext)
    }

    @ViewBuilder
    private func buildAdditionalActionsList(_ actions: [SettingsCell]) -> some View {
        ForEach(actions) { action in
            self.buildAdditionalAction(action)
                .styleAsListRow(includeDivider: action.id != actions.last?.id)
        }
    }

    @ViewBuilder
    private func buildAdditionalAction(_ settingsCell: SettingsCell) -> some View {
        if let action = settingsCell.action {
            Button(action: {
                self.viewModel.handleActionType(action: action)
            }, label: {
                settingsCell.cellProvider()
            })
        } else {
            settingsCell.cellProvider()
        }
    }

    @ViewBuilder
    private func buildLogoutButton() -> some View {
        Button(action: {
            self.viewModel.logout()
        }, label: {
            ListItemView(title: Labels.logoutActionTitle, icon: "icon-logout")
        })
    }

    @ViewBuilder
    private func buildLanguagesLink() -> some View {
        Button(action: {
            self.viewModel.didTapLanguagesButton()
        }, label: {
            ListItemView(title: Labels.languagesActionTitle,
                         icon: "icon-launch")
        })
    }

    @ViewBuilder
    private func buildThemesLinkIfNecessary() -> some View {
        if self.viewModel.hasThemeSupport {
            Button(action: {
                self.viewModel.didTapThemesButton()
            }, label: {
                ListItemView(title: Labels.themesActionTitle,
                             subtitle: self.viewModel.currentlySelectedTheme?.displayName ?? "",
                             icon: "icon-right",
                             axis: .horizontal)
            })
        }
    }

    @ViewBuilder
    private func buildMyProfileLink() -> some View {
        if MaisonKitUser.isLoggedIn {
            Button(action: {
                self.viewModel.didTapMyProfileButton()
            }, label: {
                self.buildMyProfileCell().stackWithAccessory()
            })
        }
    }

    private func buildMyProfileCell() -> some View {
        ListItemView(title: Labels.myProfileActionTitle)
    }
}

#if DEBUG
private extension SettingsView {
    @ViewBuilder
    func buildShowFlags() -> some View {
        Button(action: {
            self.viewModel.didTapShowFlags()
        }, label: {
            ListItemView(title: "Feature flags")
        })
    }
}
#endif
