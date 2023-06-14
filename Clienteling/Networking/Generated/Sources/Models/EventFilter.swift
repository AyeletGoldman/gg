/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct EventFilter: Codable, Equatable {

    /// The key of the filter
    let key: String
    /// The localised display name of the filter
    let name: String
    let values: [EventFilterValueItem]

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case values = "values"
    }

    init(key: String, name: String, values: [EventFilterValueItem]) {
        self.key = key
        self.name = name
        self.values = values
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.mkDecode(String.self, forKey: .key)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.values = try container.mkDecode([EventFilterValueItem].self, forKey: .values)
    }
}
