/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NewslettersV2: Codable, Equatable {

    let newsletters: [NewsletterV2]

    enum CodingKeys: String, CodingKey {
        case newsletters = "newsletters"
    }

    init(newsletters: [NewsletterV2]) {
        self.newsletters = newsletters
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.newsletters = try container.mkDecode([NewsletterV2].self, forKey: .newsletters)
    }
}
