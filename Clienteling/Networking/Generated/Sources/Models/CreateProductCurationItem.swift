/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateProductCurationItem: Codable, Equatable {

    let productId: String

    enum CodingKeys: String, CodingKey {
        case productId = "productId"
    }

    init(productId: String) {
        self.productId = productId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productId = try container.mkDecode(String.self, forKey: .productId)
    }
}
