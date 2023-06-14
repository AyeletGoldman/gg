/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductStockDetailsRegions: Codable, Equatable {

    /// Defines whether this stock item is available or not in the associated region.
    /// In privacy-aware situations, a user might want to show a more generic version of
    /// availability instead of a concrete number of items. This value enables the
    /// display of an in-stock/out-of-stock interface.
    let isAvailable: Bool
    let lastUpdated: ISO8601DateTime?
    let name: String
    let quantityLabel: String
    let shops: [ProductStockDetailsShop]

    enum CodingKeys: String, CodingKey {
        case isAvailable = "isAvailable"
        case lastUpdated = "lastUpdated"
        case name = "name"
        case quantityLabel = "quantityLabel"
        case shops = "shops"
    }

    init(isAvailable: Bool, lastUpdated: ISO8601DateTime? = nil, name: String, quantityLabel: String, shops: [ProductStockDetailsShop]) {
        self.isAvailable = isAvailable
        self.lastUpdated = lastUpdated
        self.name = name
        self.quantityLabel = quantityLabel
        self.shops = shops
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isAvailable = try container.mkDecode(Bool.self, forKey: .isAvailable)
        self.lastUpdated = try container.mkDecodeIfPresent(ISO8601DateTime.self, forKey: .lastUpdated)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.quantityLabel = try container.mkDecode(String.self, forKey: .quantityLabel)
        self.shops = try container.mkDecode([ProductStockDetailsShop].self, forKey: .shops)
    }
}
