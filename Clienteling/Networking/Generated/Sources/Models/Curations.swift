/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Curations: Codable, Equatable {

    let curations: [Curation]

    enum CodingKeys: String, CodingKey {
        case curations = "curations"
    }

    init(curations: [Curation]) {
        self.curations = curations
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.curations = try container.mkDecode([Curation].self, forKey: .curations)
    }
}
