/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateClientCustomFieldNumber: Codable, Equatable {

    enum CreateClientCustomFieldNumberType: String, Codable, Equatable, CaseIterable {
        case number = "number"
    }

    let name: String
    let type: CreateClientCustomFieldNumberType
    let value: Double?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case value = "value"
    }

    init(name: String, type: CreateClientCustomFieldNumberType, value: Double? = nil) {
        self.name = name
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.type = try container.mkDecode(CreateClientCustomFieldNumberType.self, forKey: .type)
        self.value = try container.mkDecodeIfPresent(Double.self, forKey: .value)
    }
}
