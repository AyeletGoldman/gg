/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NPSScoreKPI: Codable, Equatable {

    enum NPSScoreKPIType: String, Codable, Equatable, CaseIterable {
        case npsScore = "npsScore"
    }

    let type: NPSScoreKPIType
    let value: NpsFeedbackAnswerScore

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
    }

    init(type: NPSScoreKPIType, value: NpsFeedbackAnswerScore) {
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.mkDecode(NPSScoreKPIType.self, forKey: .type)
        self.value = try container.mkDecode(NpsFeedbackAnswerScore.self, forKey: .value)
    }
}
