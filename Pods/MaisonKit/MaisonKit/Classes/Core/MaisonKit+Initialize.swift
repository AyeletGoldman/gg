// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A function that should be called by any implementation to set up state for MaisonKit.
/// - Parameter sceneRegistry: a scene registry, so all scenes exported can be registered
/// - Parameter appGroup: Optional. If you use the notification service extension provided by MaisonKit you *must* provide
/// also the appGroup. This is used to set up the shared folder so that the app can communicate with the extension to exchange
/// translation content.
public func initialize(sceneRegistry: SceneRegistry, appGroup: String? = nil) {
    MaisonKit.appGroup = appGroup
    let finder = ClassFinder()
    let classes = finder.getClassList()

    // Register all routes in all modules
    finder.getClassesImplementingProtocol(from: classes, proto: RouteRegistering.self)
        .compactMap { $0 as? RouteRegistering.Type }
        .forEach { $0.registerRoutes(onto: sceneRegistry) }

    // Register all notification handlers in all modules
    finder.getClassesImplementingProtocol(from: classes, proto: NotificationsRegistering.self)
        .compactMap { $0 as? NotificationsRegistering.Type }
        .forEach { $0.registerNotificationsHandler() }

    // WARNING! This is not an ideal situation, but it appears that in SwiftUI
    // setting the background color of a TextEditor doesn't work well. When you
    // set the background of a `TextEditor` via `.background(...)` modifier it is
    // obscured by the underlying `UITextView`'s `backgroundColor`.
    // So what we do here is set the background color of all `UITextView`s to `.clear`
    // in an effort to allow styling via the Stylist.
    // If you require to set this background color in UIKit, you should do it in your
    // own instance of UITextView via the instance property `.backgroundColor`.
    // This workaround is not required in iOS 16 and above
    if #unavailable(iOS 16) {
        UITextView.appearance().backgroundColor = .clear
    }

    if let appGroup {
        let manager = LocalizationBundleManager(appGroup: appGroup)
        manager.copyBundle()
    }
}
