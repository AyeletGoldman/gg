// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Routing protocol for the Settings scene
public protocol SettingsRouter: ActionScenePresenterRouter {
    /// Presents the "My Profile" scene, usually by pushing in onto the navigation stack.
    func presentMyProfile()

    /// Presents the Themes scene, which allows the user to select their theme
    /// - Parameters:
    ///   - themes: a list of available themes in this application, as well as the currently selected theme
    ///   - onThemeSelected: a closure to invoke when a theme has been selected
    func presentThemes(themes: ThemeDisplayable, onThemeSelected: @escaping (ThemeIdentifier) -> Void)

    #if DEBUG
    /// Presents the feature flags UI
    func presentFeatureFlags()
    #endif
}

/// Default routing implementation for the Settings scene
final class DefaultSettingsRouter: Router<SettingsViewController>, SettingsRouter, DefaultActionScenePresenterRouter {

    /// Push the profile scene onto the current navigation stack
    func presentMyProfile() {
        let scene = self.factory.retrieveScene(with: MyProfileRouteDescriptor())
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    func presentThemes(themes: ThemeDisplayable, onThemeSelected: @escaping (ThemeIdentifier) -> Void) {
        let scene = self.factory.retrieveScene(with: ThemeRouteDescriptor(themes: themes,
                                                                          onSelectionChanged: onThemeSelected))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
}

#if DEBUG
extension DefaultSettingsRouter {
    func presentFeatureFlags() {
        let scene = self.factory.retrieveScene(with: FeatureFlagsRouteDescriptor())
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
}
#endif
