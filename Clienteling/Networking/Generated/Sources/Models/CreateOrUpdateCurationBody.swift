/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateOrUpdateCurationBody: Codable, Equatable {

    let items: [CreateProductCurationItem]
    let name: String

    enum CodingKeys: String, CodingKey {
        case items = "items"
        case name = "name"
    }

    init(items: [CreateProductCurationItem], name: String) {
        self.items = items
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.mkDecode([CreateProductCurationItem].self, forKey: .items)
        self.name = try container.mkDecode(String.self, forKey: .name)
    }
}
