/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ISelectedFilters: Codable, Equatable {

    let items: [IFilterItemDefault]
    let key: String

    enum CodingKeys: String, CodingKey {
        case items = "items"
        case key = "key"
    }

    init(items: [IFilterItemDefault], key: String) {
        self.items = items
        self.key = key
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.mkDecode([IFilterItemDefault].self, forKey: .items)
        self.key = try container.mkDecode(String.self, forKey: .key)
    }
}
