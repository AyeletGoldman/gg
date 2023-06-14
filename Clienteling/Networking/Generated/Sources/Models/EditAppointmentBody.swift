/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct EditAppointmentBody: Codable, Equatable {

    let channel: ChannelKey?
    /// Client id
    let clientId: String?
    /// Comments regarding the appointment
    let comments: String?
    let endTime: ISO8601DateTimeString?
    let startTime: ISO8601DateTimeString?
    /// Topic id
    let topicId: String?

    enum CodingKeys: String, CodingKey {
        case channel = "channel"
        case clientId = "clientId"
        case comments = "comments"
        case endTime = "endTime"
        case startTime = "startTime"
        case topicId = "topicId"
    }

    init(channel: ChannelKey? = nil, clientId: String? = nil, comments: String? = nil, endTime: ISO8601DateTimeString? = nil, startTime: ISO8601DateTimeString? = nil, topicId: String? = nil) {
        self.channel = channel
        self.clientId = clientId
        self.comments = comments
        self.endTime = endTime
        self.startTime = startTime
        self.topicId = topicId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.channel = try container.mkDecodeIfPresent(ChannelKey.self, forKey: .channel)
        self.clientId = try container.mkDecodeIfPresent(String.self, forKey: .clientId)
        self.comments = try container.mkDecodeIfPresent(String.self, forKey: .comments)
        self.endTime = try container.mkDecodeIfPresent(ISO8601DateTimeString.self, forKey: .endTime)
        self.startTime = try container.mkDecodeIfPresent(ISO8601DateTimeString.self, forKey: .startTime)
        self.topicId = try container.mkDecodeIfPresent(String.self, forKey: .topicId)
    }
}
