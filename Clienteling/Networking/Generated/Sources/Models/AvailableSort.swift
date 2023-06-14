/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct AvailableSort: Codable, Equatable {

    let display: String
    let key: String

    enum CodingKeys: String, CodingKey {
        case display = "display"
        case key = "key"
    }

    init(display: String, key: String) {
        self.display = display
        self.key = key
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.display = try container.mkDecode(String.self, forKey: .display)
        self.key = try container.mkDecode(String.self, forKey: .key)
    }
}
