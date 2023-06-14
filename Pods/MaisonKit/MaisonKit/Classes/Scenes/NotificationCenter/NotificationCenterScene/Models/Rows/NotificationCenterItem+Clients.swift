// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension NotificationCenterItem {

    // swiftlint:disable line_length
    private enum Labels {
        static let newClientAssigned = MKLocalizedString("notification-center.items.new-client-assigned.title",
                                                         comment: "The title for the notification that tells the user a new client was assigned to them")
        static let newActivityInImportantClient = MKLocalizedString("notification-center.items.new-activity-vic.title",
                                                                    comment: "The title for the notification that tells the user that there is new activity in a very important client")
        static let clientHasCompletedTransaction = MKLocalizedString("notification-center.items.transaction-complete.title",
                                                                     comment: "The title for the notification that tells the user that a client has completed a transaction")
    }
    // swiftlint:enable line_length

    private enum Constants {
        static let clientsImageIdentifier = StylistIdentifier("icon-clients")
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of a new client being assigned to the current user.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientID: The ID of the client that has been assigned to this user. This is then used to open the correct client details screen.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func newClientAssigned(id: String = UUID().uuidString,
                                  clientID: String,
                                  clientName: String,
                                  date: Date,
                                  isRead: Bool) -> NotificationCenterItem {
        return Self.clientItem(id: id,
                               clientID: clientID,
                               clientName: clientName,
                               date: date,
                               isRead: isRead,
                               title: Labels.newClientAssigned)
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of new activity in a very important client.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientID: The ID of the client that has been assigned to this user. This is then used to open the correct client details screen.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func newActivityInImportantClient(id: String = UUID().uuidString,
                                             clientID: String,
                                             clientName: String,
                                             date: Date,
                                             isRead: Bool) -> NotificationCenterItem {
        return Self.clientItem(id: id,
                               clientID: clientID,
                               clientName: clientName,
                               date: date,
                               isRead: isRead,
                               title: Labels.newActivityInImportantClient)
    }

    /// Creates a new `NotificationCenterItem` that  represents a notification of a new transaction being completed by one of the CA's clients.
    /// - Parameters:
    ///   - id: the notification ID. This is a stable, unique identifier for this notification.
    ///   This should not be the ID of a model like a transaction ID or a client ID since it will be used to uniquely identify this
    ///   notification in a list of notifications.
    ///   - clientID: The ID of the client that has been assigned to this user. This is then used to open the correct client details screen.
    ///   - clientName: The name of the client that has been assigned to this user.
    ///   - date: The date of the notification.
    ///   - isRead: Whether the notification has been read or not.
    /// - Returns: A new `NotificationCenterItem` fully configured and translated.
    static func clientHasCompletedTransaction(id: String = UUID().uuidString,
                                              clientID: String,
                                              clientName: String,
                                              date: Date,
                                              isRead: Bool) -> NotificationCenterItem {
        return Self.clientItem(id: id,
                               clientID: clientID,
                               clientName: clientName,
                               date: date,
                               isRead: isRead,
                               title: Labels.clientHasCompletedTransaction)
    }

    // swiftlint:disable:next function_parameter_count
    private static func clientItem(id: String,
                                   clientID: String,
                                   clientName: String,
                                   date: Date,
                                   isRead: Bool,
                                   title: String) -> NotificationCenterItem {
        return NotificationCenterItem(id: id,
                                      icon: .styledImage(identifier: Constants.clientsImageIdentifier),
                                      title: title,
                                      subtitles: [
                                        LabeledValue(label: SharedLabels.client, value: clientName)
                                      ],
                                      date: date,
                                      isRead: isRead,
                                      action: .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return Client360RouteDescriptor(clientID: clientID, clientName: clientName)
        }, preferredPresentationStyle: .push))
    }
}
