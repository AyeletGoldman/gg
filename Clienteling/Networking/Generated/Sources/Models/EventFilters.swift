/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct EventFilters: Codable, Equatable {

    let filters: [EventFilter]

    enum CodingKeys: String, CodingKey {
        case filters = "filters"
    }

    init(filters: [EventFilter]) {
        self.filters = filters
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filters = try container.mkDecode([EventFilter].self, forKey: .filters)
    }
}
