/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Price: Codable, Equatable {

    let currency: CurrencyCode
    let discountValue: Int?
    let divisor: Int
    let value: Int

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case discountValue = "discountValue"
        case divisor = "divisor"
        case value = "value"
    }

    init(currency: CurrencyCode, discountValue: Int? = nil, divisor: Int, value: Int) {
        self.currency = currency
        self.discountValue = discountValue
        self.divisor = divisor
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.mkDecode(CurrencyCode.self, forKey: .currency)
        self.discountValue = try container.mkDecodeIfPresent(Int.self, forKey: .discountValue)
        self.divisor = try container.mkDecode(Int.self, forKey: .divisor)
        self.value = try container.mkDecode(Int.self, forKey: .value)
    }
}
