/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateClientCustomFieldString: Codable, Equatable {

    enum CreateClientCustomFieldStringType: String, Codable, Equatable, CaseIterable {
        case string = "string"
    }

    let name: String
    let type: CreateClientCustomFieldStringType
    let value: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case value = "value"
    }

    init(name: String, type: CreateClientCustomFieldStringType, value: String? = nil) {
        self.name = name
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.type = try container.mkDecode(CreateClientCustomFieldStringType.self, forKey: .type)
        self.value = try container.mkDecodeIfPresent(String.self, forKey: .value)
    }
}
