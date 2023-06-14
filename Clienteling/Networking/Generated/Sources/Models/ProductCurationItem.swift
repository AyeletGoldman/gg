/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductCurationItem: Codable, Equatable {

    struct ProductCurationItemAttributes: Codable, Equatable {

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

    struct ProductCurationItemPriceRange: Codable, Equatable {

        let max: Price
        let min: Price

        enum CodingKeys: String, CodingKey {
            case max = "max"
            case min = "min"
        }

        init(max: Price, min: Price) {
            self.max = max
            self.min = min
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.max = try container.mkDecode(Price.self, forKey: .max)
            self.min = try container.mkDecode(Price.self, forKey: .min)
        }
    }

    let assets: [Asset]
    let attributes: [ProductCurationItemAttributes]
    let availability: ProductAvailabilityTag?
    let category: String
    let name: String
    let price: Price?
    let priceRange: ProductCurationItemPriceRange?
    let productId: String
    /// The short description of the current product
    let shortDescription: String
    let sku: String?

    enum CodingKeys: String, CodingKey {
        case assets = "assets"
        case attributes = "attributes"
        case availability = "availability"
        case category = "category"
        case name = "name"
        case price = "price"
        case priceRange = "priceRange"
        case productId = "productId"
        case shortDescription = "shortDescription"
        case sku = "sku"
    }

    init(assets: [Asset], attributes: [ProductCurationItemAttributes], availability: ProductAvailabilityTag? = nil, category: String, name: String, price: Price? = nil, priceRange: ProductCurationItemPriceRange? = nil, productId: String, shortDescription: String, sku: String? = nil) {
        self.assets = assets
        self.attributes = attributes
        self.availability = availability
        self.category = category
        self.name = name
        self.price = price
        self.priceRange = priceRange
        self.productId = productId
        self.shortDescription = shortDescription
        self.sku = sku
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assets = try container.mkDecode([Asset].self, forKey: .assets)
        self.attributes = try container.mkDecode([ProductCurationItemAttributes].self, forKey: .attributes)
        self.availability = try container.mkDecodeIfPresent(ProductAvailabilityTag.self, forKey: .availability)
        self.category = try container.mkDecode(String.self, forKey: .category)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.price = try container.mkDecodeIfPresent(Price.self, forKey: .price)
        self.priceRange = try container.mkDecodeIfPresent(ProductCurationItemPriceRange.self, forKey: .priceRange)
        self.productId = try container.mkDecode(String.self, forKey: .productId)
        self.shortDescription = try container.mkDecode(String.self, forKey: .shortDescription)
        self.sku = try container.mkDecodeIfPresent(String.self, forKey: .sku)
    }
}
