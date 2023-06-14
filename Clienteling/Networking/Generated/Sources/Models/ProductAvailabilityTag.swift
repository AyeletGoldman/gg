/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// A value representing a small set of information about the availability of a product
/// including a title for display and a hex value to use as an accent color.

struct ProductAvailabilityTag: Codable, Equatable {

    let colorHexValue: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case colorHexValue = "colorHexValue"
        case title = "title"
    }

    init(colorHexValue: String, title: String) {
        self.colorHexValue = colorHexValue
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.colorHexValue = try container.mkDecode(String.self, forKey: .colorHexValue)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
