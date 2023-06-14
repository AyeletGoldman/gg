// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// The notification center row with a view builder to display in the notification center screen
public struct NotificationCenterRow: Identifiable {

    /// The notification id
    public let id: String
    /// A closure that will create the view to display.
    /// The boolean that is passed in to the closure indicates whether or not this item is read.
    public let cellProvider: (Bool) -> AnyView
    /// Optional. An action to perform when the cell is tapped. If this is `nil`, the cell will not be tappable.
    public let action: ActionType?
    /// Whether the notification has read or not
    public let isRead: Bool

    /// Creates a new `NotificationCenterRow`.
    /// - Parameters:
    ///   - id: The notification id
    ///   - cellProvider: A closure that will create the view to display.
    ///     The boolean that is passed in to the closure indicates whether or not this item is read.
    ///   - action: Optional. An action to perform when the cell is tapped. If this is `nil`, the cell will not be tappable. Defaults to `nil`.
    ///   - isRead: Whether the notification has read or not
    public init<V: View>(id: String,
                         cellProvider: @escaping (Bool) -> V,
                         action: ActionType? = nil,
                         isRead: Bool) {
        self.id = id
        self.cellProvider = { cellProvider($0).eraseToAnyView() }
        self.action = action
        self.isRead = isRead
    }

    /// Creates a new `NotificationCenterRow` that will be styled like the rest of the notification center items.
    /// - Parameters:
    ///   - item: the notification to display
    init(item: NotificationCenterItem) {
        self.init(id: item.id,
                  cellProvider: { isRead in
            let newItem = NotificationCenterItem(id: item.id,
                                                 icon: item.icon,
                                                 title: item.title,
                                                 subtitles: item.subtitles,
                                                 date: item.date,
                                                 isRead: isRead)
            return NotificationCenterItemView(notification: newItem)
        },
                  action: item.action,
                  isRead: item.isRead)
    }
}
