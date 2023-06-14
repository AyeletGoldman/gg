/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductStockDetailsCurrentStore: Codable, Equatable {

    /// Defines whether this stock item is available or not in the associated region.
    /// In privacy-aware situations, a user might want to show a more generic version of
    /// availability instead of a concrete number of items. This value enables the
    /// display of an in-stock/out-of-stock interface.
    let isAvailable: Bool
    let lastUpdated: ISO8601DateTime?
    let name: String
    let quantity: Int
    let quantityLabel: String

    enum CodingKeys: String, CodingKey {
        case isAvailable = "isAvailable"
        case lastUpdated = "lastUpdated"
        case name = "name"
        case quantity = "quantity"
        case quantityLabel = "quantityLabel"
    }

    init(isAvailable: Bool, lastUpdated: ISO8601DateTime? = nil, name: String, quantity: Int, quantityLabel: String) {
        self.isAvailable = isAvailable
        self.lastUpdated = lastUpdated
        self.name = name
        self.quantity = quantity
        self.quantityLabel = quantityLabel
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isAvailable = try container.mkDecode(Bool.self, forKey: .isAvailable)
        self.lastUpdated = try container.mkDecodeIfPresent(ISO8601DateTime.self, forKey: .lastUpdated)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.quantity = try container.mkDecode(Int.self, forKey: .quantity)
        self.quantityLabel = try container.mkDecode(String.self, forKey: .quantityLabel)
    }
}
