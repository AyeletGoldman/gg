/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IDashboardMultiValueCircular: Codable, Equatable {

    let items: [IDashboardMultiValueCircularItem]
    let title: String
    let type: IDashboardType

    enum CodingKeys: String, CodingKey {
        case items = "items"
        case title = "title"
        case type = "type"
    }

    init(items: [IDashboardMultiValueCircularItem], title: String, type: IDashboardType) {
        self.items = items
        self.title = title
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.mkDecode([IDashboardMultiValueCircularItem].self, forKey: .items)
        self.title = try container.mkDecode(String.self, forKey: .title)
        self.type = try container.mkDecode(IDashboardType.self, forKey: .type)
    }
}
