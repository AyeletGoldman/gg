/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NpsFeedbackAnswerScore: Codable, Equatable {

    /// The colour that should be used in display in FE app
    enum NpsFeedbackAnswerScoreColor: String, Codable, Equatable, CaseIterable {
        case red = "red"
        case amber = "amber"
        case lightGreen = "lightGreen"
        case darkGreen = "darkGreen"
    }

    /// The colour that should be used in display in FE app
    let color: NpsFeedbackAnswerScoreColor
    /// The maximum value for an answer
    let maximumValue: Int
    /// The score related to the current DUE Feedback answer
    let score: Int

    enum CodingKeys: String, CodingKey {
        case color = "color"
        case maximumValue = "maximumValue"
        case score = "score"
    }

    init(color: NpsFeedbackAnswerScoreColor, maximumValue: Int, score: Int) {
        self.color = color
        self.maximumValue = maximumValue
        self.score = score
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.color = try container.mkDecode(NpsFeedbackAnswerScoreColor.self, forKey: .color)
        self.maximumValue = try container.mkDecode(Int.self, forKey: .maximumValue)
        self.score = try container.mkDecode(Int.self, forKey: .score)
    }
}
