/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TimelineInteractionEntry: Codable, Equatable {

    enum TimelineInteractionEntryType: String, Codable, Equatable, CaseIterable {
        case interaction = "interaction"
    }

    let advisorName: String
    let advisorStore: Store
    let channel: InteractionChannel
    let datetime: ISO8601DateTime
    let id: String
    let metadata: InteractionV2Metadata
    let storeName: String?
    let type: TimelineInteractionEntryType

    enum CodingKeys: String, CodingKey {
        case advisorName = "advisorName"
        case advisorStore = "advisorStore"
        case channel = "channel"
        case datetime = "datetime"
        case id = "id"
        case metadata = "metadata"
        case storeName = "storeName"
        case type = "type"
    }

    init(advisorName: String, advisorStore: Store, channel: InteractionChannel, datetime: ISO8601DateTime, id: String, metadata: InteractionV2Metadata, storeName: String? = nil, type: TimelineInteractionEntryType) {
        self.advisorName = advisorName
        self.advisorStore = advisorStore
        self.channel = channel
        self.datetime = datetime
        self.id = id
        self.metadata = metadata
        self.storeName = storeName
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorName = try container.mkDecode(String.self, forKey: .advisorName)
        self.advisorStore = try container.mkDecode(Store.self, forKey: .advisorStore)
        self.channel = try container.mkDecode(InteractionChannel.self, forKey: .channel)
        self.datetime = try container.mkDecode(ISO8601DateTime.self, forKey: .datetime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.metadata = try container.mkDecode(InteractionV2Metadata.self, forKey: .metadata)
        self.storeName = try container.mkDecodeIfPresent(String.self, forKey: .storeName)
        self.type = try container.mkDecode(TimelineInteractionEntryType.self, forKey: .type)
    }
}
