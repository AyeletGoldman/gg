/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct SelectedSort: Codable, Equatable {

    let key: String
    let order: SortDirection

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case order = "order"
    }

    init(key: String, order: SortDirection) {
        self.key = key
        self.order = order
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.mkDecode(String.self, forKey: .key)
        self.order = try container.mkDecode(SortDirection.self, forKey: .order)
    }
}
