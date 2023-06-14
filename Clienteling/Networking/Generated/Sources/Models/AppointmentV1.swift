/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AppointmentV1: Codable, Equatable {

    enum AppointmentV1Status: String, Codable, Equatable, CaseIterable {
        case scheduled = "Scheduled"
        case inProgress = "In Progress"
        case completed = "Completed"
        case canceled = "Canceled"
    }

    /// Advisor id
    let advisorId: String?
    /// Appointment number
    let appointmentNumber: String
    let channel: Channel
    /// Client id
    let clientId: String
    /// Comments regarding the appointment
    let comments: String?
    let consultation: AppointmentConsultation?
    let endTime: ISO8601DateTimeString
    /// Id of the group
    let id: String
    let startTime: ISO8601DateTimeString
    let status: AppointmentV1Status
    /// Territory id
    let territoryId: String?
    let topic: TopicGroup

    enum CodingKeys: String, CodingKey {
        case advisorId = "advisorId"
        case appointmentNumber = "appointmentNumber"
        case channel = "channel"
        case clientId = "clientId"
        case comments = "comments"
        case consultation = "consultation"
        case endTime = "endTime"
        case id = "id"
        case startTime = "startTime"
        case status = "status"
        case territoryId = "territoryId"
        case topic = "topic"
    }

    init(advisorId: String? = nil, appointmentNumber: String, channel: Channel, clientId: String, comments: String? = nil, consultation: AppointmentConsultation? = nil, endTime: ISO8601DateTimeString, id: String, startTime: ISO8601DateTimeString, status: AppointmentV1Status, territoryId: String? = nil, topic: TopicGroup) {
        self.advisorId = advisorId
        self.appointmentNumber = appointmentNumber
        self.channel = channel
        self.clientId = clientId
        self.comments = comments
        self.consultation = consultation
        self.endTime = endTime
        self.id = id
        self.startTime = startTime
        self.status = status
        self.territoryId = territoryId
        self.topic = topic
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorId = try container.mkDecodeIfPresent(String.self, forKey: .advisorId)
        self.appointmentNumber = try container.mkDecode(String.self, forKey: .appointmentNumber)
        self.channel = try container.mkDecode(Channel.self, forKey: .channel)
        self.clientId = try container.mkDecode(String.self, forKey: .clientId)
        self.comments = try container.mkDecodeIfPresent(String.self, forKey: .comments)
        self.consultation = try container.mkDecodeIfPresent(AppointmentConsultation.self, forKey: .consultation)
        self.endTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .endTime)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.startTime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .startTime)
        self.status = try container.mkDecode(AppointmentV1Status.self, forKey: .status)
        self.territoryId = try container.mkDecodeIfPresent(String.self, forKey: .territoryId)
        self.topic = try container.mkDecode(TopicGroup.self, forKey: .topic)
    }
}
