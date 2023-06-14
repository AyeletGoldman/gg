/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionV1: Codable, Equatable {

    let advisorName: String
    let channel: InteractionChannel?
    let clientName: String?
    let context: InteractionContext
    let datetime: ISO8601DateTime
    let id: String
    let metadata: InteractionMetadata?
    let subtitle: String?
    let title: String
    let type: String?

    enum CodingKeys: String, CodingKey {
        case advisorName = "advisorName"
        case channel = "channel"
        case clientName = "clientName"
        case context = "context"
        case datetime = "datetime"
        case id = "id"
        case metadata = "metadata"
        case subtitle = "subtitle"
        case title = "title"
        case type = "type"
    }

    init(advisorName: String, channel: InteractionChannel? = nil, clientName: String? = nil, context: InteractionContext, datetime: ISO8601DateTime, id: String, metadata: InteractionMetadata? = nil, subtitle: String? = nil, title: String, type: String? = nil) {
        self.advisorName = advisorName
        self.channel = channel
        self.clientName = clientName
        self.context = context
        self.datetime = datetime
        self.id = id
        self.metadata = metadata
        self.subtitle = subtitle
        self.title = title
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorName = try container.mkDecode(String.self, forKey: .advisorName)
        self.channel = try container.mkDecodeIfPresent(InteractionChannel.self, forKey: .channel)
        self.clientName = try container.mkDecodeIfPresent(String.self, forKey: .clientName)
        self.context = try container.mkDecode(InteractionContext.self, forKey: .context)
        self.datetime = try container.mkDecode(ISO8601DateTime.self, forKey: .datetime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.metadata = try container.mkDecodeIfPresent(InteractionMetadata.self, forKey: .metadata)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
        self.title = try container.mkDecode(String.self, forKey: .title)
        self.type = try container.mkDecodeIfPresent(String.self, forKey: .type)
    }
}
