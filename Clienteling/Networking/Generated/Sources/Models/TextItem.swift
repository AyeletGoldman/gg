/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TextItem: Codable, Equatable {

    let categoryId: String
    let categoryName: String
    let next: ProductCategoryNextItemType

    enum CodingKeys: String, CodingKey {
        case categoryId = "categoryId"
        case categoryName = "categoryName"
        case next = "next"
    }

    init(categoryId: String, categoryName: String, next: ProductCategoryNextItemType) {
        self.categoryId = categoryId
        self.categoryName = categoryName
        self.next = next
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.categoryId = try container.mkDecode(String.self, forKey: .categoryId)
        self.categoryName = try container.mkDecode(String.self, forKey: .categoryName)
        self.next = try container.mkDecode(ProductCategoryNextItemType.self, forKey: .next)
    }
}
