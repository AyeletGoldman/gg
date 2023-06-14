/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardMultiValueBar: Codable, Equatable {

    let bars: [IDashboardMultiValueBarBars]
    let title: String
    let type: IDashboardType
    let value: TypedValue

    enum CodingKeys: String, CodingKey {
        case bars = "bars"
        case title = "title"
        case type = "type"
        case value = "value"
    }

    init(bars: [IDashboardMultiValueBarBars], title: String, type: IDashboardType, value: TypedValue) {
        self.bars = bars
        self.title = title
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bars = try container.mkDecode([IDashboardMultiValueBarBars].self, forKey: .bars)
        self.title = try container.mkDecode(String.self, forKey: .title)
        self.type = try container.mkDecode(IDashboardType.self, forKey: .type)
        self.value = try container.mkDecode(TypedValue.self, forKey: .value)
    }
}
