/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AttributesListItem: Codable, Equatable {

    let displayName: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case name = "name"
    }

    init(displayName: String, name: String) {
        self.displayName = displayName
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.displayName = try container.mkDecode(String.self, forKey: .displayName)
        self.name = try container.mkDecode(String.self, forKey: .name)
    }
}
