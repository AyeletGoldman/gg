/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AddProductsBody: Codable, Equatable {

    let items: [CreateProductCurationItem]

    enum CodingKeys: String, CodingKey {
        case items = "items"
    }

    init(items: [CreateProductCurationItem]) {
        self.items = items
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.mkDecode([CreateProductCurationItem].self, forKey: .items)
    }
}
