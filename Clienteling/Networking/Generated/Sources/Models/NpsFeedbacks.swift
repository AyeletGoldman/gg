/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NpsFeedbacks: Codable, Equatable {

    let nps: [NpsFeedback]

    enum CodingKeys: String, CodingKey {
        case nps = "nps"
    }

    init(nps: [NpsFeedback]) {
        self.nps = nps
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nps = try container.mkDecode([NpsFeedback].self, forKey: .nps)
    }
}
