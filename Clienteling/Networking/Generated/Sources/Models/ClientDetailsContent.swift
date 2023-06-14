/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientDetailsContent: Codable, Equatable {

    let items: [TypedValue]
    let title: String

    enum CodingKeys: String, CodingKey {
        case items = "items"
        case title = "title"
    }

    init(items: [TypedValue], title: String) {
        self.items = items
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.mkDecode([TypedValue].self, forKey: .items)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
