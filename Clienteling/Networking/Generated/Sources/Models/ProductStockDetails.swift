/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductStockDetails: Codable, Equatable {

    let currentStore: ProductStockDetailsCurrentStore
    let regions: [ProductStockDetailsRegions]?

    enum CodingKeys: String, CodingKey {
        case currentStore = "currentStore"
        case regions = "regions"
    }

    init(currentStore: ProductStockDetailsCurrentStore, regions: [ProductStockDetailsRegions]? = nil) {
        self.currentStore = currentStore
        self.regions = regions
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currentStore = try container.mkDecode(ProductStockDetailsCurrentStore.self, forKey: .currentStore)
        self.regions = try container.mkDecodeIfPresent([ProductStockDetailsRegions].self, forKey: .regions)
    }
}
