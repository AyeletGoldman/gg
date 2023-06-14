/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Delivery: Codable, Equatable {

    /// The price of this delivery in [minor units]
    let amount: Int
    let type: DeliveryType

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case type = "type"
    }

    init(amount: Int, type: DeliveryType) {
        self.amount = amount
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.mkDecode(Int.self, forKey: .amount)
        self.type = try container.mkDecode(DeliveryType.self, forKey: .type)
    }
}
