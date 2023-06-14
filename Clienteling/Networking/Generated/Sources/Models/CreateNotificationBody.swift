/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateNotificationBody: Codable, Equatable {

    let client: Client?
    let metadata: NotificationMetadata
    /// Mark this notification as high priority. This makes the notification bypasses the grouping process and be sent immediately to the CA device.
    let priority: Bool?
    /// Set to true if you don't want to store this notification.
    let skipPersistence: Bool?
    /// Source from which this notification has been emitted
    let source: String?
    /// Target user device token. Takes precedence over token from user subscription
    let userDeviceToken: String?
    /// Target user id (must be email when creating a notification)
    let userId: String

    enum CodingKeys: String, CodingKey {
        case client = "client"
        case metadata = "metadata"
        case priority = "priority"
        case skipPersistence = "skipPersistence"
        case source = "source"
        case userDeviceToken = "userDeviceToken"
        case userId = "userId"
    }

    init(client: Client? = nil, metadata: NotificationMetadata, priority: Bool? = nil, skipPersistence: Bool? = nil, source: String? = nil, userDeviceToken: String? = nil, userId: String) {
        self.client = client
        self.metadata = metadata
        self.priority = priority
        self.skipPersistence = skipPersistence
        self.source = source
        self.userDeviceToken = userDeviceToken
        self.userId = userId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.client = try container.mkDecodeIfPresent(Client.self, forKey: .client)
        self.metadata = try container.mkDecode(NotificationMetadata.self, forKey: .metadata)
        self.priority = try container.mkDecodeIfPresent(Bool.self, forKey: .priority)
        self.skipPersistence = try container.mkDecodeIfPresent(Bool.self, forKey: .skipPersistence)
        self.source = try container.mkDecodeIfPresent(String.self, forKey: .source)
        self.userDeviceToken = try container.mkDecodeIfPresent(String.self, forKey: .userDeviceToken)
        self.userId = try container.mkDecode(String.self, forKey: .userId)
    }
}
