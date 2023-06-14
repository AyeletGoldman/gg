/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardSingleValueBar: Codable, Equatable {

    let progressBarValue: IDashboardSingleValueBarProgressValue
    let subtitle: String?
    let title: String
    let type: IDashboardType
    let value: TypedValue

    enum CodingKeys: String, CodingKey {
        case progressBarValue = "progressBarValue"
        case subtitle = "subtitle"
        case title = "title"
        case type = "type"
        case value = "value"
    }

    init(progressBarValue: IDashboardSingleValueBarProgressValue, subtitle: String? = nil, title: String, type: IDashboardType, value: TypedValue) {
        self.progressBarValue = progressBarValue
        self.subtitle = subtitle
        self.title = title
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.progressBarValue = try container.mkDecode(IDashboardSingleValueBarProgressValue.self, forKey: .progressBarValue)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
        self.title = try container.mkDecode(String.self, forKey: .title)
        self.type = try container.mkDecode(IDashboardType.self, forKey: .type)
        self.value = try container.mkDecode(TypedValue.self, forKey: .value)
    }
}
