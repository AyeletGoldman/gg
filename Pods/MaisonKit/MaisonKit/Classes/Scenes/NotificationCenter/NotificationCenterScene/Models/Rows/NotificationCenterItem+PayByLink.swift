// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension NotificationCenterItem {

    private enum Labels {
        static let payByLinkURLExpired = MKLocalizedString("notification-center.items.pbl-url-expired.title",
                                                           comment: "The title for the notification that tells the user a link has expired")
        static let payByLinkPaymentMade = MKLocalizedString("notification-center.items.pbl-payment-made.title",
                                                           comment: "The title for the notification that tells the user a payment has been made")
    }

    private enum Constants {
        static let payByLinkIdentifier = StylistIdentifier("icon-pay-by-link")
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of a pay-by-link URL that has expired..
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientID: The ID of the client that has been assigned to this user. This is then used to open the correct client details screen.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - linkID: The ID of the pay-by-link transaction.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func payByLinkURLExpired(id: String = UUID().uuidString,
                                    clientID: String,
                                    clientName: String,
                                    linkID: String,
                                    date: Date,
                                    isRead: Bool) -> NotificationCenterItem {
        return NotificationCenterItem(id: id,
                                      icon: .styledImage(identifier: Constants.payByLinkIdentifier),
                                      title: Labels.payByLinkURLExpired,
                                      subtitles: [],
                                      date: date,
                                      isRead: isRead,
                                      action: .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return TransactionDetailsRouteDescriptor(transactionId: linkID)
        }, preferredPresentationStyle: .push))
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of a new payment being made for a pay-by-link URL.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientID: The ID of the client that has been assigned to this user. This is then used to open the correct client details screen.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - linkID: The ID of the pay-by-link transaction.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func payByLinkPaymentMade(id: String = UUID().uuidString,
                                     clientID: String,
                                     clientName: String,
                                     linkID: String,
                                     date: Date,
                                     isRead: Bool) -> NotificationCenterItem {
        return NotificationCenterItem(id: id,
                                      icon: .styledImage(identifier: Constants.payByLinkIdentifier),
                                      title: Labels.payByLinkPaymentMade,
                                      subtitles: [],
                                      date: date,
                                      isRead: isRead,
                                      action: .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return TransactionDetailsRouteDescriptor(transactionId: linkID)
        }, preferredPresentationStyle: .push))
    }
}
