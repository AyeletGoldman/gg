/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateLinkResponse: Codable, Equatable {

    /// Generated unique link
    let link: URL

    enum CodingKeys: String, CodingKey {
        case link = "link"
    }

    init(link: URL) {
        self.link = link
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.link = try container.mkDecode(URL.self, forKey: .link)
    }
}
