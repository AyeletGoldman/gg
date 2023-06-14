/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardCircularStat: Codable, Equatable {

    let circularBarValues: [IDashboardCircularStatCircularValue]
    let subtitle: String
    let title: String
    let type: IDashboardType
    let value: TypedValue

    enum CodingKeys: String, CodingKey {
        case circularBarValues = "circularBarValues"
        case subtitle = "subtitle"
        case title = "title"
        case type = "type"
        case value = "value"
    }

    init(circularBarValues: [IDashboardCircularStatCircularValue], subtitle: String, title: String, type: IDashboardType, value: TypedValue) {
        self.circularBarValues = circularBarValues
        self.subtitle = subtitle
        self.title = title
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.circularBarValues = try container.mkDecode([IDashboardCircularStatCircularValue].self, forKey: .circularBarValues)
        self.subtitle = try container.mkDecode(String.self, forKey: .subtitle)
        self.title = try container.mkDecode(String.self, forKey: .title)
        self.type = try container.mkDecode(IDashboardType.self, forKey: .type)
        self.value = try container.mkDecode(TypedValue.self, forKey: .value)
    }
}
