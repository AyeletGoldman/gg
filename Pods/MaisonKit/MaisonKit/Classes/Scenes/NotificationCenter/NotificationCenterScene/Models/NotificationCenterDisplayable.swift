// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// Holds all the information for notification center screen
public struct NotificationCenterDisplayable {
    /// Array of notification sections to display
    public let sections: [NotificationCenterSection]

    /// Creates an instance of `NotificationCenterDisplayable`
    /// - Parameters:
    ///   - sections: Array of notification sections to display
    public init(sections: [NotificationCenterSection]) {
        self.sections = sections
    }
}

public extension NotificationCenterDisplayable {

    /// Creates a new `NotificationCenterDisplayable` with the given items, and separates them into
    /// two sections: a today section and a recent section. The items are sorted by date and then added to the
    /// correct section.
    /// - Parameter items: the items to be shown in the notification center. These items will be sorted by date and divided
    /// into two sections: today and recent.
    init(items: [NotificationCenterItem]) {
        if items.isEmpty {
            self.sections = []
        } else {
            var todayItems = [NotificationCenterItem]()
            var recentItems = [NotificationCenterItem]()
            let startOfToday = Calendar.autoupdatingCurrent.startOfDay(for: Date())
            items.sorted { $0.date > $1.date }.forEach { item in
                if Calendar.autoupdatingCurrent.startOfDay(for: item.date) == startOfToday {
                    todayItems.append(item)
                } else {
                    recentItems.append(item)
                }
            }
            self.sections = [
                NotificationCenterSection(sectionTitle: NotificationCenterSection.Labels.today,
                                          items: todayItems),
                NotificationCenterSection(sectionTitle: NotificationCenterSection.Labels.recent,
                                          items: recentItems)
            ]
        }
    }
}
