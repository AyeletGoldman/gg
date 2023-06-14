// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The notification center section to display
public struct NotificationCenterSection: Identifiable {

    /// An identifier for this section, to enable animations
    public let id: String
    /// The notification center section title
    public let sectionTitle: String
    /// Array of notifications to display
    public let items: [NotificationCenterRow]

    /// Creates an instance of `NotificationCenterSection`
    /// - Parameters:
    ///   - id: An identifier for this section, to enable animations
    ///   - sectionTitle: The notification center section title
    ///   - items: Array of views to display as notifications
    public init(id: String = UUID().uuidString, sectionTitle: String, items: [NotificationCenterRow]) {
        self.id = id
        self.sectionTitle = sectionTitle
        self.items = items
    }
}

public extension NotificationCenterSection {

    internal enum Labels {
        static let today = MKLocalizedString("notification-center.today-section.title",
                                             comment: "Title for today notification center section")
        static let recent = MKLocalizedString("notification-center.recent-section.title",
                                              comment: "Title for recent notification center section")
    }

    /// Created `NotificationCenterSection` with the today title
    /// - Parameter items: Array of notifications to display
    /// - Returns: `NotificationCenterSection` with items and today title
    static func today(items: [NotificationCenterItem]) -> NotificationCenterSection {
        return NotificationCenterSection(sectionTitle: Labels.today, items: items)
    }

    /// Created `NotificationCenterSection` with the ercent title
    /// - Parameter items: Array of notifications to display
    /// - Returns: `NotificationCenterSection` with items and ercent title
    static func recent(items: [NotificationCenterItem]) -> NotificationCenterSection {
        return NotificationCenterSection(sectionTitle: Labels.recent, items: items)
    }
}

public extension NotificationCenterSection {
    /// Creates an instance of `NotificationCenterSection`
    /// - Parameters:
    ///   - sectionTitle: The notification center section title
    ///   - items: Array of notifications to display
    init(sectionTitle: String, items: [NotificationCenterItem]) {
        self.init(sectionTitle: sectionTitle, items: items.map { NotificationCenterRow(item: $0) })
    }
}
