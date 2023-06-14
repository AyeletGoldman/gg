/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardSingleValueBarProgressValue: Codable, Equatable {

    let value: Double

    enum CodingKeys: String, CodingKey {
        case value = "value"
    }

    init(value: Double) {
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.mkDecode(Double.self, forKey: .value)
    }
}
