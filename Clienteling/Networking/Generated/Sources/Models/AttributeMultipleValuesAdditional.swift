/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AttributeMultipleValuesAdditional: Codable, Equatable {

    let attributeValueItem: AttributeValueItem
    let display: String
    /// a string representation of the attribute for display purposes
    let value: String

    enum CodingKeys: String, CodingKey {
        case attributeValueItem = "attributeValueItem"
        case display = "display"
        case value = "value"
    }

    init(attributeValueItem: AttributeValueItem, display: String, value: String) {
        self.attributeValueItem = attributeValueItem
        self.display = display
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributeValueItem = try container.mkDecode(AttributeValueItem.self, forKey: .attributeValueItem)
        self.display = try container.mkDecode(String.self, forKey: .display)
        self.value = try container.mkDecode(String.self, forKey: .value)
    }
}
