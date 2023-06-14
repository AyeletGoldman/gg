/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NpsFeedback: Codable, Equatable {

    let client: Client?
    let datetime: ISO8601DateTimeString
    let eventSource: NpsEventSource
    let id: String
    /// The name associated to the feedback
    let name: String
    let score: NpsFeedbackAnswerScore

    enum CodingKeys: String, CodingKey {
        case client = "client"
        case datetime = "datetime"
        case eventSource = "eventSource"
        case id = "id"
        case name = "name"
        case score = "score"
    }

    init(client: Client? = nil, datetime: ISO8601DateTimeString, eventSource: NpsEventSource, id: String, name: String, score: NpsFeedbackAnswerScore) {
        self.client = client
        self.datetime = datetime
        self.eventSource = eventSource
        self.id = id
        self.name = name
        self.score = score
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.client = try container.mkDecodeIfPresent(Client.self, forKey: .client)
        self.datetime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .datetime)
        self.eventSource = try container.mkDecode(NpsEventSource.self, forKey: .eventSource)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.score = try container.mkDecode(NpsFeedbackAnswerScore.self, forKey: .score)
    }
}
