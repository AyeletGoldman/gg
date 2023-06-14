/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NpsFeedbackDetails: Codable, Equatable {

    let answers: [NpsFeedbackAnswer]
    let client: Client?
    /// The comment left by the client when submitting the survey
    let comment: String?
    let datetime: ISO8601DateTimeString
    let eventSource: NpsEventSource
    let id: String
    /// The name associated to the feedback
    let name: String
    let order: TransactionV2?
    let score: NpsFeedbackAnswerScore

    enum CodingKeys: String, CodingKey {
        case answers = "answers"
        case client = "client"
        case comment = "comment"
        case datetime = "datetime"
        case eventSource = "eventSource"
        case id = "id"
        case name = "name"
        case order = "order"
        case score = "score"
    }

    init(answers: [NpsFeedbackAnswer], client: Client? = nil, comment: String? = nil, datetime: ISO8601DateTimeString, eventSource: NpsEventSource, id: String, name: String, order: TransactionV2? = nil, score: NpsFeedbackAnswerScore) {
        self.answers = answers
        self.client = client
        self.comment = comment
        self.datetime = datetime
        self.eventSource = eventSource
        self.id = id
        self.name = name
        self.order = order
        self.score = score
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.answers = try container.mkDecode([NpsFeedbackAnswer].self, forKey: .answers)
        self.client = try container.mkDecodeIfPresent(Client.self, forKey: .client)
        self.comment = try container.mkDecodeIfPresent(String.self, forKey: .comment)
        self.datetime = try container.mkDecode(ISO8601DateTimeString.self, forKey: .datetime)
        self.eventSource = try container.mkDecode(NpsEventSource.self, forKey: .eventSource)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.order = try container.mkDecodeIfPresent(TransactionV2.self, forKey: .order)
        self.score = try container.mkDecode(NpsFeedbackAnswerScore.self, forKey: .score)
    }
}
