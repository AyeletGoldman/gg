/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TransactionAdditionalData: Codable, Equatable {

    /// Name of the item.
    let name: String
    let price: Price
    /// Type of the item.
    let type: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case price = "price"
        case type = "type"
    }

    init(name: String, price: Price, type: String) {
        self.name = name
        self.price = price
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.price = try container.mkDecode(Price.self, forKey: .price)
        self.type = try container.mkDecode(String.self, forKey: .type)
    }
}
