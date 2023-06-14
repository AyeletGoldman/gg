/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct NewslettersV1: Codable, Equatable {

    let newsletters: [NewsletterV1]

    enum CodingKeys: String, CodingKey {
        case newsletters = "newsletters"
    }

    init(newsletters: [NewsletterV1]) {
        self.newsletters = newsletters
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.newsletters = try container.mkDecode([NewsletterV1].self, forKey: .newsletters)
    }
}
