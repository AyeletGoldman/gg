/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductSummary: Codable, Equatable {

    struct ProductSummaryAttributes: Codable, Equatable {

        let displayName: String
        let displayValue: String

        enum CodingKeys: String, CodingKey {
            case displayName = "displayName"
            case displayValue = "displayValue"
        }

        init(displayName: String, displayValue: String) {
            self.displayName = displayName
            self.displayValue = displayValue
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.displayName = try container.mkDecode(String.self, forKey: .displayName)
            self.displayValue = try container.mkDecode(String.self, forKey: .displayValue)
        }
    }

    let attributes: [ProductSummaryAttributes]?
    let availability: ProductAvailabilityTag?
    let category: Category
    let colorAttribute: ColorAttribute?
    let id: String
    let image: URL
    let masterId: String?
    let name: String
    let price: Price?
    let shortDescription: String?
    let sku: String
    let type: SummaryTypes

    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
        case availability = "availability"
        case category = "category"
        case colorAttribute = "colorAttribute"
        case id = "id"
        case image = "image"
        case masterId = "masterId"
        case name = "name"
        case price = "price"
        case shortDescription = "shortDescription"
        case sku = "sku"
        case type = "type"
    }

    init(attributes: [ProductSummaryAttributes]? = nil, availability: ProductAvailabilityTag? = nil, category: Category, colorAttribute: ColorAttribute? = nil, id: String, image: URL, masterId: String? = nil, name: String, price: Price? = nil, shortDescription: String? = nil, sku: String, type: SummaryTypes) {
        self.attributes = attributes
        self.availability = availability
        self.category = category
        self.colorAttribute = colorAttribute
        self.id = id
        self.image = image
        self.masterId = masterId
        self.name = name
        self.price = price
        self.shortDescription = shortDescription
        self.sku = sku
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributes = try container.mkDecodeIfPresent([ProductSummaryAttributes].self, forKey: .attributes)
        self.availability = try container.mkDecodeIfPresent(ProductAvailabilityTag.self, forKey: .availability)
        self.category = try container.mkDecode(Category.self, forKey: .category)
        self.colorAttribute = try container.mkDecodeIfPresent(ColorAttribute.self, forKey: .colorAttribute)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.image = try container.mkDecode(URL.self, forKey: .image)
        self.masterId = try container.mkDecodeIfPresent(String.self, forKey: .masterId)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.price = try container.mkDecodeIfPresent(Price.self, forKey: .price)
        self.shortDescription = try container.mkDecodeIfPresent(String.self, forKey: .shortDescription)
        self.sku = try container.mkDecode(String.self, forKey: .sku)
        self.type = try container.mkDecode(SummaryTypes.self, forKey: .type)
    }
}
