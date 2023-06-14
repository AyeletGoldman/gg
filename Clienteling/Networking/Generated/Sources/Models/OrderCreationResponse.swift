/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct OrderCreationResponse: Codable, Equatable {

    /// The ID of the order that was created.
    let orderId: String

    enum CodingKeys: String, CodingKey {
        case orderId = "orderId"
    }

    init(orderId: String) {
        self.orderId = orderId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.orderId = try container.mkDecode(String.self, forKey: .orderId)
    }
}
