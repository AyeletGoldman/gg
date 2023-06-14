/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AttributesSearchResult: Codable, Equatable {

    let attributePossibleValues: AttributeMultipleValues
    let masterId: String
    let productId: String?

    enum CodingKeys: String, CodingKey {
        case attributePossibleValues = "attributePossibleValues"
        case masterId = "masterId"
        case productId = "productId"
    }

    init(attributePossibleValues: AttributeMultipleValues, masterId: String, productId: String? = nil) {
        self.attributePossibleValues = attributePossibleValues
        self.masterId = masterId
        self.productId = productId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributePossibleValues = try container.mkDecode(AttributeMultipleValues.self, forKey: .attributePossibleValues)
        self.masterId = try container.mkDecode(String.self, forKey: .masterId)
        self.productId = try container.mkDecodeIfPresent(String.self, forKey: .productId)
    }
}
