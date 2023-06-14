/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CardItem: Codable, Equatable {

    enum CardItemSize: String, Codable, Equatable, CaseIterable {
        case small = "small"
        case medium = "medium"
        case large = "large"
    }

    let categoryId: String
    let categoryName: String
    let image: String
    let next: ProductCategoryNextItemType
    let size: CardItemSize

    enum CodingKeys: String, CodingKey {
        case categoryId = "categoryId"
        case categoryName = "categoryName"
        case image = "image"
        case next = "next"
        case size = "size"
    }

    init(categoryId: String, categoryName: String, image: String, next: ProductCategoryNextItemType, size: CardItemSize) {
        self.categoryId = categoryId
        self.categoryName = categoryName
        self.image = image
        self.next = next
        self.size = size
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.categoryId = try container.mkDecode(String.self, forKey: .categoryId)
        self.categoryName = try container.mkDecode(String.self, forKey: .categoryName)
        self.image = try container.mkDecode(String.self, forKey: .image)
        self.next = try container.mkDecode(ProductCategoryNextItemType.self, forKey: .next)
        self.size = try container.mkDecode(CardItemSize.self, forKey: .size)
    }
}
