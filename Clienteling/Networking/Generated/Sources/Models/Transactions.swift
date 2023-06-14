/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Transactions: Codable, Equatable {

    let transactions: [Transaction]

    enum CodingKeys: String, CodingKey {
        case transactions = "transactions"
    }

    init(transactions: [Transaction]) {
        self.transactions = transactions
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transactions = try container.mkDecode([Transaction].self, forKey: .transactions)
    }
}
