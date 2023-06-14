/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardMultiValueBarBarsProgressValue: Codable, Equatable {

    let color: String
    let displayValue: String
    let name: String
    let value: Double

    enum CodingKeys: String, CodingKey {
        case color = "color"
        case displayValue = "displayValue"
        case name = "name"
        case value = "value"
    }

    init(color: String, displayValue: String, name: String, value: Double) {
        self.color = color
        self.displayValue = displayValue
        self.name = name
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.color = try container.mkDecode(String.self, forKey: .color)
        self.displayValue = try container.mkDecode(String.self, forKey: .displayValue)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.value = try container.mkDecode(Double.self, forKey: .value)
    }
}
