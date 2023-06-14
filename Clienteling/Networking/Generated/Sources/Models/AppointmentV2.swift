/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AppointmentV2: Codable, Equatable {

    let advisor: Advisor
    let channel: Channel
    let client: Client
    /// Comments regarding the appointment
    let comments: String?
    let endTime: ISO8601DateTimeString
    /// Appointment id
    let id: String
    let startTime: ISO8601DateTimeString
    let territory: AppointmentTerritory
    let topic: TopicGroup
    /// Appointment type
    let type: String

    enum CodingKeys: String, CodingKey {
        case advisor = "advisor"
        case channel = "channel"
        case client = "client"
        case comments = "comments"
        case endTime = "endTime"
        case id = "id"
        case startTime = "startTime"
        case territory = "territory"
        case topic = "topic"
        case type = "type"
    }

    init(advisor: Advisor, channel: Channel, client: Client, comments: String? = nil, endTime: ISO8601DateTimeString, id: String, startTime: ISO8601DateTimeString, territory: AppointmentTerritory, topic: TopicGroup, type: String) {
        self.advisor = advisor
        self.channel = channel
        self.client = client
        self.comments = comments
        self.endTime = endTime
        self.id = id
        self.startTime = startTime
        self.territory = territory
        self.topic = topic
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisor = try container.mkDecode(Advisor.self, forKey: .advisor)
        self.channel = try container.mkDecode(Channel.self, forKey: .channel)
        self.client = try container.mkDecode(Client.self, forKey: .client)
        self.comments = try container.mkDecodeIfPresent(String.self, forKey: .comments)
        self.endTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .endTime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.startTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .startTime)
        self.territory = try container.mkDecode(AppointmentTerritory.self, forKey: .territory)
        self.topic = try container.mkDecode(TopicGroup.self, forKey: .topic)
        self.type = try container.mkDecode(String.self, forKey: .type)
    }
}
