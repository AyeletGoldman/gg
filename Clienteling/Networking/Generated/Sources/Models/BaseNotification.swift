/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct BaseNotification: Codable, Equatable {

    let client: Client?
    let metadata: NotificationMetadata
    /// Target user id (must be email when creating a notification)
    let userId: String

    enum CodingKeys: String, CodingKey {
        case client = "client"
        case metadata = "metadata"
        case userId = "userId"
    }

    init(client: Client? = nil, metadata: NotificationMetadata, userId: String) {
        self.client = client
        self.metadata = metadata
        self.userId = userId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.client = try container.mkDecodeIfPresent(Client.self, forKey: .client)
        self.metadata = try container.mkDecode(NotificationMetadata.self, forKey: .metadata)
        self.userId = try container.mkDecode(String.self, forKey: .userId)
    }
}
