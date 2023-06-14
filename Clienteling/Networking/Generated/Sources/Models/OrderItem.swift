/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct OrderItem: Codable, Equatable {

    struct OrderItemAmount: Codable, Equatable {

        /// Item amount excluding the tax, in minor units.
        let excludingTax: Int
        /// Item amount including the tax, in minor units.
        let includingTax: Int

        enum CodingKeys: String, CodingKey {
            case excludingTax = "excludingTax"
            case includingTax = "includingTax"
        }

        init(excludingTax: Int, includingTax: Int) {
            self.excludingTax = excludingTax
            self.includingTax = includingTax
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.excludingTax = try container.mkDecode(Int.self, forKey: .excludingTax)
            self.includingTax = try container.mkDecode(Int.self, forKey: .includingTax)
        }
    }

    struct OrderItemTax: Codable, Equatable {

        /// Required for AfterPay. Tax category: High, Low, None, Zero
        enum OrderItemTaxCategory: String, Codable, Equatable, CaseIterable {
            case high = "High"
            case low = "Low"
            case none = "None"
            case zero = "Zero"
        }

        /// Tax amount, in minor units.
        let amount: Int
        /// Required for AfterPay. Tax category: High, Low, None, Zero
        let category: OrderItemTaxCategory?
        /// Tax percentage, in minor units.
        let percentage: Int?

        enum CodingKeys: String, CodingKey {
            case amount = "amount"
            case category = "category"
            case percentage = "percentage"
        }

        init(amount: Int, category: OrderItemTaxCategory? = nil, percentage: Int? = nil) {
            self.amount = amount
            self.category = category
            self.percentage = percentage
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.amount = try container.mkDecode(Int.self, forKey: .amount)
            self.category = try container.mkDecodeIfPresent(OrderItemTaxCategory.self, forKey: .category)
            self.percentage = try container.mkDecodeIfPresent(Int.self, forKey: .percentage)
        }
    }

    let amount: OrderItemAmount
    let attributes: TransactionItemAttributes
    let availability: ProductAvailabilityTag
    let category: Category
    /// ID of the item.
    let id: String
    /// Image of product.
    let image: String
    /// Name of the item.
    let name: String
    /// Number of items.
    let quantity: Int
    let tax: OrderItemTax

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case attributes = "attributes"
        case availability = "availability"
        case category = "category"
        case id = "id"
        case image = "image"
        case name = "name"
        case quantity = "quantity"
        case tax = "tax"
    }

    init(amount: OrderItemAmount, attributes: TransactionItemAttributes, availability: ProductAvailabilityTag, category: Category, id: String, image: String, name: String, quantity: Int, tax: OrderItemTax) {
        self.amount = amount
        self.attributes = attributes
        self.availability = availability
        self.category = category
        self.id = id
        self.image = image
        self.name = name
        self.quantity = quantity
        self.tax = tax
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.mkDecode(OrderItemAmount.self, forKey: .amount)
        self.attributes = try container.mkDecode(TransactionItemAttributes.self, forKey: .attributes)
        self.availability = try container.mkDecode(ProductAvailabilityTag.self, forKey: .availability)
        self.category = try container.mkDecode(Category.self, forKey: .category)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.image = try container.mkDecode(String.self, forKey: .image)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.quantity = try container.mkDecode(Int.self, forKey: .quantity)
        self.tax = try container.mkDecode(OrderItemTax.self, forKey: .tax)
    }
}
