/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionMetadata: Codable, Equatable {

    let productId: String?
    let productName: String?

    enum CodingKeys: String, CodingKey {
        case productId = "productId"
        case productName = "productName"
    }

    init(productId: String? = nil, productName: String? = nil) {
        self.productId = productId
        self.productName = productName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productId = try container.mkDecodeIfPresent(String.self, forKey: .productId)
        self.productName = try container.mkDecodeIfPresent(String.self, forKey: .productName)
    }
}
