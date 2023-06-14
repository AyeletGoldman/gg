/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductStockResult: Codable, Equatable {

    let stocks: ProductStockDetails

    enum CodingKeys: String, CodingKey {
        case stocks = "stocks"
    }

    init(stocks: ProductStockDetails) {
        self.stocks = stocks
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.stocks = try container.mkDecode(ProductStockDetails.self, forKey: .stocks)
    }
}
