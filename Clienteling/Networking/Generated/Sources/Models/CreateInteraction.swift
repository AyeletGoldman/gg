/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateInteraction: Codable, Equatable {

    let advisorId: String
    let channel: InteractionChannel?
    let clientId: String
    let context: InteractionContext
    let datetime: ISO8601DateTime
    let metadata: InteractionMetadata?
    let subtitle: String?
    let templateId: String?
    let title: String

    enum CodingKeys: String, CodingKey {
        case advisorId = "advisorId"
        case channel = "channel"
        case clientId = "clientId"
        case context = "context"
        case datetime = "datetime"
        case metadata = "metadata"
        case subtitle = "subtitle"
        case templateId = "templateId"
        case title = "title"
    }

    init(advisorId: String, channel: InteractionChannel? = nil, clientId: String, context: InteractionContext, datetime: ISO8601DateTime, metadata: InteractionMetadata? = nil, subtitle: String? = nil, templateId: String? = nil, title: String) {
        self.advisorId = advisorId
        self.channel = channel
        self.clientId = clientId
        self.context = context
        self.datetime = datetime
        self.metadata = metadata
        self.subtitle = subtitle
        self.templateId = templateId
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorId = try container.mkDecode(String.self, forKey: .advisorId)
        self.channel = try container.mkDecodeIfPresent(InteractionChannel.self, forKey: .channel)
        self.clientId = try container.mkDecode(String.self, forKey: .clientId)
        self.context = try container.mkDecode(InteractionContext.self, forKey: .context)
        self.datetime = try container.mkDecode(ISO8601DateTime.self, forKey: .datetime)
        self.metadata = try container.mkDecodeIfPresent(InteractionMetadata.self, forKey: .metadata)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
        self.templateId = try container.mkDecodeIfPresent(String.self, forKey: .templateId)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
