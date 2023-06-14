/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardMultiValueCircularItem: Codable, Equatable {

    let color: String
    let icon: String
    let subtitle: String?
    let title: String
    let value: Double

    enum CodingKeys: String, CodingKey {
        case color = "color"
        case icon = "icon"
        case subtitle = "subtitle"
        case title = "title"
        case value = "value"
    }

    init(color: String, icon: String, subtitle: String? = nil, title: String, value: Double) {
        self.color = color
        self.icon = icon
        self.subtitle = subtitle
        self.title = title
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.color = try container.mkDecode(String.self, forKey: .color)
        self.icon = try container.mkDecode(String.self, forKey: .icon)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
        self.title = try container.mkDecode(String.self, forKey: .title)
        self.value = try container.mkDecode(Double.self, forKey: .value)
    }
}
