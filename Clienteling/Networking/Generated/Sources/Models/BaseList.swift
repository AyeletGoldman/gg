/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct BaseList: Codable, Equatable {

    let id: String
    let subtitle: String?
    let title: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case subtitle = "subtitle"
        case title = "title"
    }

    init(id: String, subtitle: String? = nil, title: String) {
        self.id = id
        self.subtitle = subtitle
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
