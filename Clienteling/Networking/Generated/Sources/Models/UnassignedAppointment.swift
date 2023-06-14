/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct UnassignedAppointment: Codable, Equatable {

    let channel: Channel
    let client: Client
    let consultation: AppointmentConsultation?
    let endTime: ISO8601DateTimeString
    /// Appointment id
    let id: String
    let startTime: ISO8601DateTimeString
    let territory: AppointmentTerritory
    let topic: TopicGroup

    enum CodingKeys: String, CodingKey {
        case channel = "channel"
        case client = "client"
        case consultation = "consultation"
        case endTime = "endTime"
        case id = "id"
        case startTime = "startTime"
        case territory = "territory"
        case topic = "topic"
    }

    init(channel: Channel, client: Client, consultation: AppointmentConsultation? = nil, endTime: ISO8601DateTimeString, id: String, startTime: ISO8601DateTimeString, territory: AppointmentTerritory, topic: TopicGroup) {
        self.channel = channel
        self.client = client
        self.consultation = consultation
        self.endTime = endTime
        self.id = id
        self.startTime = startTime
        self.territory = territory
        self.topic = topic
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.channel = try container.mkDecode(Channel.self, forKey: .channel)
        self.client = try container.mkDecode(Client.self, forKey: .client)
        self.consultation = try container.mkDecodeIfPresent(AppointmentConsultation.self, forKey: .consultation)
        self.endTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .endTime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.startTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .startTime)
        self.territory = try container.mkDecode(AppointmentTerritory.self, forKey: .territory)
        self.topic = try container.mkDecode(TopicGroup.self, forKey: .topic)
    }
}
