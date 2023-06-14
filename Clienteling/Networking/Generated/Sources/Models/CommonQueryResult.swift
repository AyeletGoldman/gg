/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CommonQueryResult: Codable, Equatable {

    let filters: JSON?
    let items: JSON
    let sort: Sort?

    enum CodingKeys: String, CodingKey {
        case filters = "filters"
        case items = "items"
        case sort = "sort"
    }

    init(filters: JSON? = nil, items: JSON, sort: Sort? = nil) {
        self.filters = filters
        self.items = items
        self.sort = sort
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filters = try container.mkDecodeIfPresent(JSON.self, forKey: .filters)
        self.items = try container.mkDecode(JSON.self, forKey: .items)
        self.sort = try container.mkDecodeIfPresent(Sort.self, forKey: .sort)
    }
}
