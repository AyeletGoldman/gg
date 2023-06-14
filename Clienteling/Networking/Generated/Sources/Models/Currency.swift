/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Currency: Codable, Equatable {

    /// A currency code in ISO-4217. 3 letters, uppercase.
    let code: String
    /// The number of minor units in a major unit of the currency
    let divisor: Int

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case divisor = "divisor"
    }

    init(code: String, divisor: Int) {
        self.code = code
        self.divisor = divisor
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.mkDecode(String.self, forKey: .code)
        self.divisor = try container.mkDecode(Int.self, forKey: .divisor)
    }
}
