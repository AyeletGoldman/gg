/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientTimelineActions: Codable, Equatable {

    let actions: [ClientTimelineActionsContent]

    enum CodingKeys: String, CodingKey {
        case actions = "actions"
    }

    init(actions: [ClientTimelineActionsContent]) {
        self.actions = actions
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actions = try container.mkDecode([ClientTimelineActionsContent].self, forKey: .actions)
    }
}
