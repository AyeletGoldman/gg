/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductDetailAttributes: Codable, Equatable {

    let list: AttributesList
    let values: AttributesValues

    enum CodingKeys: String, CodingKey {
        case list = "list"
        case values = "values"
    }

    init(list: AttributesList, values: AttributesValues) {
        self.list = list
        self.values = values
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.list = try container.mkDecode(AttributesList.self, forKey: .list)
        self.values = try container.mkDecode(AttributesValues.self, forKey: .values)
    }
}
