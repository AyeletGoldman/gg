/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct FilterImage: Codable, Equatable {

    enum FilterImageType: String, Codable, Equatable, CaseIterable {
        case images = "images"
    }

    let displayName: String
    let isMultiSelect: Bool
    let isRequired: Bool
    let name: String
    let type: FilterImageType
    let value: [FilterItemImage]

    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case isMultiSelect = "isMultiSelect"
        case isRequired = "isRequired"
        case name = "name"
        case type = "type"
        case value = "value"
    }

    init(displayName: String, isMultiSelect: Bool, isRequired: Bool, name: String, type: FilterImageType, value: [FilterItemImage]) {
        self.displayName = displayName
        self.isMultiSelect = isMultiSelect
        self.isRequired = isRequired
        self.name = name
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.displayName = try container.mkDecode(String.self, forKey: .displayName)
        self.isMultiSelect = try container.mkDecode(Bool.self, forKey: .isMultiSelect)
        self.isRequired = try container.mkDecode(Bool.self, forKey: .isRequired)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.type = try container.mkDecode(FilterImageType.self, forKey: .type)
        self.value = try container.mkDecode([FilterItemImage].self, forKey: .value)
    }
}
