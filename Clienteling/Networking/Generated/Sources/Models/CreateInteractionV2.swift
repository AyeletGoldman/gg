/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateInteractionV2: Codable, Equatable {

    let channel: InteractionChannel
    let clientId: String
    let datetime: ISO8601DateTime
    let metadata: InteractionV2CreationMetadata
    let subtitle: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case channel = "channel"
        case clientId = "clientId"
        case datetime = "datetime"
        case metadata = "metadata"
        case subtitle = "subtitle"
        case title = "title"
    }

    init(channel: InteractionChannel, clientId: String, datetime: ISO8601DateTime, metadata: InteractionV2CreationMetadata, subtitle: String? = nil, title: String? = nil) {
        self.channel = channel
        self.clientId = clientId
        self.datetime = datetime
        self.metadata = metadata
        self.subtitle = subtitle
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.channel = try container.mkDecode(InteractionChannel.self, forKey: .channel)
        self.clientId = try container.mkDecode(String.self, forKey: .clientId)
        self.datetime = try container.mkDecode(ISO8601DateTime.self, forKey: .datetime)
        self.metadata = try container.mkDecode(InteractionV2CreationMetadata.self, forKey: .metadata)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
        self.title = try container.mkDecodeIfPresent(String.self, forKey: .title)
    }
}
