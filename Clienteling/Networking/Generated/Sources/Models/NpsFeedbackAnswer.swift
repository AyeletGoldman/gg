/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NpsFeedbackAnswer: Codable, Equatable {

    /// The id of the DUE Feedback Answer
    let id: String
    /// The question related to the current DUE Feedback answer
    let question: String
    let score: NpsFeedbackAnswerScore

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case question = "question"
        case score = "score"
    }

    init(id: String, question: String, score: NpsFeedbackAnswerScore) {
        self.id = id
        self.question = question
        self.score = score
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.question = try container.mkDecode(String.self, forKey: .question)
        self.score = try container.mkDecode(NpsFeedbackAnswerScore.self, forKey: .score)
    }
}
