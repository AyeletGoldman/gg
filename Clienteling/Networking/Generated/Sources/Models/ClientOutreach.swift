/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientOutreach: Codable, Equatable {

    let channels: [ClientOutreachChannel]

    enum CodingKeys: String, CodingKey {
        case channels = "channels"
    }

    init(channels: [ClientOutreachChannel]) {
        self.channels = channels
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.channels = try container.mkDecode([ClientOutreachChannel].self, forKey: .channels)
    }
}
