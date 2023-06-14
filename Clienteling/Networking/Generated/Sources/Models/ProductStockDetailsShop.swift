/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductStockDetailsShop: Codable, Equatable {

    let address: String
    let name: String
    let quantity: Int

    enum CodingKeys: String, CodingKey {
        case address = "address"
        case name = "name"
        case quantity = "quantity"
    }

    init(address: String, name: String, quantity: Int) {
        self.address = address
        self.name = name
        self.quantity = quantity
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.mkDecode(String.self, forKey: .address)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.quantity = try container.mkDecode(Int.self, forKey: .quantity)
    }
}
