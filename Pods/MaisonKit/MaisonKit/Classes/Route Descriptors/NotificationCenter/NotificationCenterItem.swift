// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The notification center item to display in the notification center screen
public struct NotificationCenterItem: Identifiable {

    /// The notification ID
    public let id: String
    /// The icon to diplay in the notification item
    public let icon: ImageSource
    /// The notification title
    public let title: String
    /// The notification subtitles
    public let subtitles: [LabeledValue]
    /// The notification received date
    public let date: Date
    /// Whether the notification has read or not
    public let isRead: Bool
    /// Optional. The action to perform on tapping the notification item
    public let action: ActionType?

    /// Creates an instance of `NotificationCenterItem`
    /// - Parameters:
    ///   - id: The notification id
    ///   - icon: The icon to diplay in the notification item
    ///   - title: The notification title
    ///   - subtitles: The notification subtitles
    ///   - date: The notification received date
    ///   - isRead: Whether the notification has read or not
    ///   - action: Optional. The action to perform on tapping the notification item
    public init(id: String,
                icon: ImageSource,
                title: String,
                subtitles: [LabeledValue] = [],
                date: Date,
                isRead: Bool,
                action: ActionType? = nil) {
        self.id = id
        self.icon = icon
        self.title = title
        self.subtitles = subtitles
        self.date = date
        self.isRead = isRead
        self.action = action
    }
}
