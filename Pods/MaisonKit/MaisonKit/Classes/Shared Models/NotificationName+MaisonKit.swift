// Copyright © 2022 LVMH. All rights reserved.

import Foundation

extension Notification.Name {
    /// The notification that's sent when the user logs out
    public static let userDidLogoutNotificationName = Notification.Name(rawValue: "maisonkit.userDidLogoutNotificationName")
    /// A notification that is sent when the user logs in.
    /// This notification is posted internally by the `AppCoordinator` when the logging in succeeds. If you are handling your own coordination of login/main controller
    /// you should post this notification to the default `NotificationCenter` as soon as you consider your user logged in.
    public static let userDidLoginNotificationName = Notification.Name(rawValue: "maisonkit.userDidLoginNotificationName")

    static let showToastNotification = Notification.Name(rawValue: "maisonkit.showToastNotification")

    /// The notification that's sent when the theme selected changes. This is also
    public static let themeDidChangeNotification = Notification.Name(rawValue: "maisonkit.themeDidChangeNotification")
}
