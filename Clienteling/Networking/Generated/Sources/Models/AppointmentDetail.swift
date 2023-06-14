/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AppointmentDetail: Codable, Equatable {

    let advisor: Advisor
    let channel: Channel
    let client: Client
    /// Comments regarding the appointment
    let comments: String?
    let consultation: AppointmentConsultation?
    let endTime: ISO8601DateTimeString
    /// Appointment id
    let id: String
    /// Whether the appointment has been cancelled
    let isCancelled: Bool
    /// Whether the user is allowed do edit the appointment or not
    let isEditable: Bool
    let startTime: ISO8601DateTimeString
    let territory: AppointmentTerritory
    let topic: TopicGroup

    enum CodingKeys: String, CodingKey {
        case advisor = "advisor"
        case channel = "channel"
        case client = "client"
        case comments = "comments"
        case consultation = "consultation"
        case endTime = "endTime"
        case id = "id"
        case isCancelled = "isCancelled"
        case isEditable = "isEditable"
        case startTime = "startTime"
        case territory = "territory"
        case topic = "topic"
    }

    init(advisor: Advisor, channel: Channel, client: Client, comments: String? = nil, consultation: AppointmentConsultation? = nil, endTime: ISO8601DateTimeString, id: String, isCancelled: Bool, isEditable: Bool, startTime: ISO8601DateTimeString, territory: AppointmentTerritory, topic: TopicGroup) {
        self.advisor = advisor
        self.channel = channel
        self.client = client
        self.comments = comments
        self.consultation = consultation
        self.endTime = endTime
        self.id = id
        self.isCancelled = isCancelled
        self.isEditable = isEditable
        self.startTime = startTime
        self.territory = territory
        self.topic = topic
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisor = try container.mkDecode(Advisor.self, forKey: .advisor)
        self.channel = try container.mkDecode(Channel.self, forKey: .channel)
        self.client = try container.mkDecode(Client.self, forKey: .client)
        self.comments = try container.mkDecodeIfPresent(String.self, forKey: .comments)
        self.consultation = try container.mkDecodeIfPresent(AppointmentConsultation.self, forKey: .consultation)
        self.endTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .endTime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.isCancelled = try container.mkDecode(Bool.self, forKey: .isCancelled)
        self.isEditable = try container.mkDecode(Bool.self, forKey: .isEditable)
        self.startTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .startTime)
        self.territory = try container.mkDecode(AppointmentTerritory.self, forKey: .territory)
        self.topic = try container.mkDecode(TopicGroup.self, forKey: .topic)
    }
}
