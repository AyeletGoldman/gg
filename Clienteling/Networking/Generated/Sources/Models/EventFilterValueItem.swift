/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct EventFilterValueItem: Codable, Equatable {

    /// The key of the value. This will be returned with the filter key as its value
    let key: String
    /// The localised name of the value that will be displayed as filter option
    let name: String

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
    }

    init(key: String, name: String) {
        self.key = key
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.mkDecode(String.self, forKey: .key)
        self.name = try container.mkDecode(String.self, forKey: .name)
    }
}
