// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Combine

public protocol NotificationCenterAdapter {

    /// Requests the notification center items
    /// - Returns: A publisher that contains the notification center data.
    func getNotificationCenterItems() -> AnyPublisher<Result<NotificationCenterDisplayable, ErrorDisplayable>, Error>

    /// Requests that the implementer of this adapter mark the notification identified by the given ID as "read"
    /// - Parameter itemID: the ID of the notification to be marked as read
    /// - Returns: A publisher that will complete with a `Void` value if successful or with an `ErrorDisplayable` if there was an error to show
    func markItemAsRead(itemID: NotificationCenterRow.ID) -> VoidResultPublisher

    /// Requests that the implementer of this adapter mark the notification identified by the given ID as "unread"
    /// - Parameter itemID: the ID of the notification to be marked as unread
    /// - Returns: A publisher that will complete with a `Void` value if successful or with an `ErrorDisplayable` if there was an error to show
    func markItemAsUnread(itemID: NotificationCenterRow.ID) -> VoidResultPublisher
}
