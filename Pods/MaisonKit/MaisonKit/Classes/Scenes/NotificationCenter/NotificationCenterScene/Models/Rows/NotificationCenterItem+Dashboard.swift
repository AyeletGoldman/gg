// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension NotificationCenterItem {

    private enum Labels {
        static let dashboardPerformanceAchievedTitle = MKLocalizedString("notification-center.items.dashboard-performance-achieved.title",
                                                                         comment: "The title for the notification that tells the user they have met their performance goal")
    }

    private enum Constants {
        static let dashboardImageIdentifier = StylistIdentifier("icon-trophy")
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of the user's performance being achieved in a certain area.
    /// On tapping this notification, the system presents the scene represented by the `DashboardRouteDescriptor`.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func dashboardPerformanceAchieved(id: String = UUID().uuidString, date: Date, isRead: Bool) -> NotificationCenterItem {
        return NotificationCenterItem(id: id,
                                      icon: .styledImage(identifier: Constants.dashboardImageIdentifier),
                                      title: Labels.dashboardPerformanceAchievedTitle,
                                      date: date,
                                      isRead: isRead,
                                      action: .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return DashboardRouteDescriptor()
        }, preferredPresentationStyle: .push))
    }
}
