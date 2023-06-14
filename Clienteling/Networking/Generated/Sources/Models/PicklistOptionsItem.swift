/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PicklistOptionsItem: Codable, Equatable {

    let label: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case label = "label"
        case value = "value"
    }

    init(label: String, value: String) {
        self.label = label
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.mkDecode(String.self, forKey: .label)
        self.value = try container.mkDecode(String.self, forKey: .value)
    }
}
