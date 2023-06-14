// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension NotificationCenterItem {

    private enum Labels {
        static let newFeaturedList = MKLocalizedString("notification-center.items.new-featured-list.title",
                                                       comment: "The title for the notification that tells the user a new featured list is available")
    }

    private enum Constants {
        static let clientListsIdentifier = StylistIdentifier("icon-list")
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of a new featured list that has been created and shared by HQ.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - listID: The ID of the list. This is used to load the correct list when this notification is selected.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func newFeaturedList(id: String = UUID().uuidString,
                                listID: String,
                                date: Date,
                                isRead: Bool) -> NotificationCenterItem {
        return NotificationCenterItem(id: id,
                                      icon: .styledImage(identifier: Constants.clientListsIdentifier),
                                      title: Labels.newFeaturedList,
                                      subtitles: [],
                                      date: date,
                                      isRead: isRead,
                                      action: .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return MemberListRouteDescriptor(listId: listID, listType: "featured", onDeleted: nil)
        }, preferredPresentationStyle: .push))
    }
}
