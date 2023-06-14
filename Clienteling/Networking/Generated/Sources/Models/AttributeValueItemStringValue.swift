/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AttributeValueItemStringValue: Codable, Equatable {

    /// The type which will help the FE team to parse and display the value.
    enum AttributeValueItemStringValueType: String, Codable, Equatable, CaseIterable {
        case string = "string"
    }

    let availability: ProductAvailabilityTag
    /// Defines whether the attribute has been selected or not
    let isSelected: Bool
    /// The name that needs to be used by the FE in the query parameter selection.
    let name: String
    /// The type which will help the FE team to parse and display the value.
    let type: AttributeValueItemStringValueType
    let value: String

    enum CodingKeys: String, CodingKey {
        case availability = "availability"
        case isSelected = "isSelected"
        case name = "name"
        case type = "type"
        case value = "value"
    }

    init(availability: ProductAvailabilityTag, isSelected: Bool, name: String, type: AttributeValueItemStringValueType, value: String) {
        self.availability = availability
        self.isSelected = isSelected
        self.name = name
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.availability = try container.mkDecode(ProductAvailabilityTag.self, forKey: .availability)
        self.isSelected = try container.mkDecode(Bool.self, forKey: .isSelected)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.type = try container.mkDecode(AttributeValueItemStringValueType.self, forKey: .type)
        self.value = try container.mkDecode(String.self, forKey: .value)
    }
}
