/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Channel: Codable, Equatable {

    let key: ChannelKey
    /// Label to display
    let label: String

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case label = "label"
    }

    init(key: ChannelKey, label: String) {
        self.key = key
        self.label = label
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.mkDecode(ChannelKey.self, forKey: .key)
        self.label = try container.mkDecode(String.self, forKey: .label)
    }
}
