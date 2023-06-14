/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PaymentNotificationWebhookBody: Codable, Equatable {

    /// Specifies whether the event that triggered the notification happened on the test or live environment.
    enum PaymentNotificationWebhookBodyLive: String, Codable, Equatable, CaseIterable {
        case _true = "true"
        case _false = "false"
    }

    struct PaymentNotificationWebhookBodyNotificationItems: Codable, Equatable {

        let notificationRequestItem: NotificationRequestItem?

        enum CodingKeys: String, CodingKey {
            case notificationRequestItem = "NotificationRequestItem"
        }

        init(notificationRequestItem: NotificationRequestItem? = nil) {
            self.notificationRequestItem = notificationRequestItem
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.notificationRequestItem = try container.mkDecodeIfPresent(NotificationRequestItem.self, forKey: .notificationRequestItem)
        }
    }

    /// Specifies whether the event that triggered the notification happened on the test or live environment.
    let live: PaymentNotificationWebhookBodyLive?
    let notificationItems: [PaymentNotificationWebhookBodyNotificationItems]?

    enum CodingKeys: String, CodingKey {
        case live = "live"
        case notificationItems = "notificationItems"
    }

    init(live: PaymentNotificationWebhookBodyLive? = nil, notificationItems: [PaymentNotificationWebhookBodyNotificationItems]? = nil) {
        self.live = live
        self.notificationItems = notificationItems
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.live = try container.mkDecodeIfPresent(PaymentNotificationWebhookBodyLive.self, forKey: .live)
        self.notificationItems = try container.mkDecodeIfPresent([PaymentNotificationWebhookBodyNotificationItems].self, forKey: .notificationItems)
    }
}
