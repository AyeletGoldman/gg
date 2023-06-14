/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PatchAsset: Codable, Equatable {

    /// Unique asset id within the curations
    let id: String
    let isSelected: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case isSelected = "isSelected"
    }

    init(id: String, isSelected: Bool) {
        self.id = id
        self.isSelected = isSelected
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.isSelected = try container.mkDecode(Bool.self, forKey: .isSelected)
    }
}
