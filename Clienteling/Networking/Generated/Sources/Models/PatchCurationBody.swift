/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PatchCurationBody: Codable, Equatable {

    let items: [PatchProductCurationItem]?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case items = "items"
        case name = "name"
    }

    init(items: [PatchProductCurationItem]? = nil, name: String? = nil) {
        self.items = items
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.mkDecodeIfPresent([PatchProductCurationItem].self, forKey: .items)
        self.name = try container.mkDecodeIfPresent(String.self, forKey: .name)
    }
}
