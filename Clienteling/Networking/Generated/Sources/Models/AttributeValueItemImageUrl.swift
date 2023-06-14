/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AttributeValueItemImageUrl: Codable, Equatable {

    enum AttributeValueItemImageUrlType: String, Codable, Equatable, CaseIterable {
        case imageUrl = "imageUrl"
    }

    let availability: ProductAvailabilityTag
    /// Defines whether the attribute has been selected or not
    let isSelected: Bool
    /// The name that needs to be used by the FE in the query parameter selection.
    let name: String
    let type: AttributeValueItemImageUrlType
    let value: URL

    enum CodingKeys: String, CodingKey {
        case availability = "availability"
        case isSelected = "isSelected"
        case name = "name"
        case type = "type"
        case value = "value"
    }

    init(availability: ProductAvailabilityTag, isSelected: Bool, name: String, type: AttributeValueItemImageUrlType, value: URL) {
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
        self.type = try container.mkDecode(AttributeValueItemImageUrlType.self, forKey: .type)
        self.value = try container.mkDecode(URL.self, forKey: .value)
    }
}
