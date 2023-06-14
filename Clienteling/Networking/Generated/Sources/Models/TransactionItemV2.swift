/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TransactionItemV2: Codable, Equatable {

    struct TransactionItemV2Price: Codable, Equatable {

        /// Item amount excluding the tax.
        let excludingTax: Price
        /// Item amount including the tax.
        let includingTax: Price

        enum CodingKeys: String, CodingKey {
            case excludingTax = "excludingTax"
            case includingTax = "includingTax"
        }

        init(excludingTax: Price, includingTax: Price) {
            self.excludingTax = excludingTax
            self.includingTax = includingTax
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.excludingTax = try container.mkDecode(Price.self, forKey: .excludingTax)
            self.includingTax = try container.mkDecode(Price.self, forKey: .includingTax)
        }
    }

    struct TransactionItemV2Tax: Codable, Equatable {

        let amount: Price
        /// Tax percentage, in minor units.
        let percentage: Int?

        enum CodingKeys: String, CodingKey {
            case amount = "amount"
            case percentage = "percentage"
        }

        init(amount: Price, percentage: Int? = nil) {
            self.amount = amount
            self.percentage = percentage
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.amount = try container.mkDecode(Price.self, forKey: .amount)
            self.percentage = try container.mkDecodeIfPresent(Int.self, forKey: .percentage)
        }
    }

    let attributes: TransactionItemAttributes
    let availability: ProductAvailabilityTag
    let category: Category
    /// Image of product.
    let image: URL?
    /// Name of the item.
    let name: String
    let price: TransactionItemV2Price
    /// Number of items.
    let quantity: Int
    /// ID of the product.
    let sku: String
    let tax: TransactionItemV2Tax

    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
        case availability = "availability"
        case category = "category"
        case image = "image"
        case name = "name"
        case price = "price"
        case quantity = "quantity"
        case sku = "sku"
        case tax = "tax"
    }

    init(attributes: TransactionItemAttributes, availability: ProductAvailabilityTag, category: Category, image: URL? = nil, name: String, price: TransactionItemV2Price, quantity: Int, sku: String, tax: TransactionItemV2Tax) {
        self.attributes = attributes
        self.availability = availability
        self.category = category
        self.image = image
        self.name = name
        self.price = price
        self.quantity = quantity
        self.sku = sku
        self.tax = tax
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributes = try container.mkDecode(TransactionItemAttributes.self, forKey: .attributes)
        self.availability = try container.mkDecode(ProductAvailabilityTag.self, forKey: .availability)
        self.category = try container.mkDecode(Category.self, forKey: .category)
        self.image = try container.mkDecodeIfPresent(URL.self, forKey: .image)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.price = try container.mkDecode(TransactionItemV2Price.self, forKey: .price)
        self.quantity = try container.mkDecode(Int.self, forKey: .quantity)
        self.sku = try container.mkDecode(String.self, forKey: .sku)
        self.tax = try container.mkDecode(TransactionItemV2Tax.self, forKey: .tax)
    }
}
