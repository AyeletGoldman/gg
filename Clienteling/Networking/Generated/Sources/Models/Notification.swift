/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Notification: Codable, Equatable {

    let client: Client?
    /// Notification creation date
    let createdDate: ISO8601DateTime
    let id: String
    /// Whether the notification has been read or not
    let isRead: Bool
    let metadata: NotificationMetadata
    /// Target user id (must be email when creating a notification)
    let userId: String

    enum CodingKeys: String, CodingKey {
        case client = "client"
        case createdDate = "createdDate"
        case id = "id"
        case isRead = "isRead"
        case metadata = "metadata"
        case userId = "userId"
    }

    init(client: Client? = nil, createdDate: ISO8601DateTime, id: String, isRead: Bool, metadata: NotificationMetadata, userId: String) {
        self.client = client
        self.createdDate = createdDate
        self.id = id
        self.isRead = isRead
        self.metadata = metadata
        self.userId = userId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.client = try container.mkDecodeIfPresent(Client.self, forKey: .client)
        self.createdDate = try container.mkDecode(ISO8601DateTime.self, forKey: .createdDate)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.isRead = try container.mkDecode(Bool.self, forKey: .isRead)
        self.metadata = try container.mkDecode(NotificationMetadata.self, forKey: .metadata)
        self.userId = try container.mkDecode(String.self, forKey: .userId)
    }
}
