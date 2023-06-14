// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class SettingsRoutes: NSObject, RouteRegistering {
    /// Registers all routes available to the Settings module.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerSettingsRoute(onto: registry)
        self.registerMyProfileRoute(onto: registry)
        self.registerMailComposerRoute(onto: registry)
        self.registerThemesRoute(onto: registry)
        #if DEBUG
        registry.registerScene { (_: FeatureFlagsRouteDescriptor) in
            return FeatureFlagsScene()
        }
        #endif
    }
}

/// The routes available in the Settings module are registered via this enum.
private extension SettingsRoutes {

    static func registerSettingsRoute(onto registry: SceneRegistry) {
        registry.registerScene { (_: SettingsRouteDescriptor) in
            return SettingsScene()
        }
    }

    static func registerMyProfileRoute(onto registry: SceneRegistry) {
        registry.registerScene { (_: MyProfileRouteDescriptor) in
            return MyProfileScene()
        }
    }

    static func registerMailComposerRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: MailComposerRouteDescriptor) in
            return MailComposerScene(emailData: descriptor.emailData, onDone: descriptor.onDone)
        }
    }

    static func registerThemesRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ThemeRouteDescriptor) in
            return ThemeScene(themes: descriptor.themes,
                              onSelectionChanged: descriptor.onSelectionChanged)
        }
    }
}
