/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Information: Codable, Equatable {

    let name: String
    let type: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case value = "value"
    }

    init(name: String, type: String, value: String) {
        self.name = name
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.type = try container.mkDecode(String.self, forKey: .type)
        self.value = try container.mkDecode(String.self, forKey: .value)
    }
}
