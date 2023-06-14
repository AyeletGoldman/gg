/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct RecordUpdateOrCreationInternalServerError: Codable, Equatable {

    /// Translation key representing a validation error/warning message
    let translationKey: String
    let type: RecordUpdateOrCreationIssueEnum

    enum CodingKeys: String, CodingKey {
        case translationKey = "translationKey"
        case type = "type"
    }

    init(translationKey: String, type: RecordUpdateOrCreationIssueEnum) {
        self.translationKey = translationKey
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.translationKey = try container.mkDecode(String.self, forKey: .translationKey)
        self.type = try container.mkDecode(RecordUpdateOrCreationIssueEnum.self, forKey: .type)
    }
}
