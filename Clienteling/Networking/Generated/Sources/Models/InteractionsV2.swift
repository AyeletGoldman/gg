/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionsV2: Codable, Equatable {

    let interactions: [InteractionV2]

    enum CodingKeys: String, CodingKey {
        case interactions = "interactions"
    }

    init(interactions: [InteractionV2]) {
        self.interactions = interactions
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.interactions = try container.mkDecode([InteractionV2].self, forKey: .interactions)
    }
}
