// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension NotificationCenterItem {

    private enum Labels {
        static let newNPSReceived = MKLocalizedString("notification-center.items.new-nps.title",
                                                       comment: "The title for the notification that tells the user a new NPS feedback is available")
    }

    private enum Constants {
        static let clientListsIdentifier = StylistIdentifier("icon-notes")
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of a new NPS score received by the current user.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - npsID: The ID of the NPS object. This is used to load the correct details for the NPS score when the notification is tapped.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func npsReceived(id: String = UUID().uuidString,
                            clientName: String,
                            npsID: String,
                            date: Date,
                            isRead: Bool) -> NotificationCenterItem {
        return NotificationCenterItem(id: id,
                                      icon: .styledImage(identifier: Constants.clientListsIdentifier),
                                      title: Labels.newNPSReceived,
                                      subtitles: [LabeledValue(label: SharedLabels.client, value: clientName)],
                                      date: date,
                                      isRead: isRead,
                                      action: .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return NPSDetailsRouteDescriptor(id: npsID)
        }, preferredPresentationStyle: .push))
    }
}
