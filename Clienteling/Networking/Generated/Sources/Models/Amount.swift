/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Amount: Codable, Equatable {

    /// The three-character [ISO currency code]
    let currency: String
    /// The amount of the transaction, in [minor units]
    let value: Int

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case value = "value"
    }

    init(currency: String, value: Int) {
        self.currency = currency
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.mkDecode(String.self, forKey: .currency)
        self.value = try container.mkDecode(Int.self, forKey: .value)
    }
}
