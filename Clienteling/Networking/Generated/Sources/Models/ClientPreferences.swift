/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientPreferences: Codable, Equatable {

    let preferences: [TypedValue]

    enum CodingKeys: String, CodingKey {
        case preferences = "preferences"
    }

    init(preferences: [TypedValue]) {
        self.preferences = preferences
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.preferences = try container.mkDecode([TypedValue].self, forKey: .preferences)
    }
}
