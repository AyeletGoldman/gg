/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductDetails: Codable, Equatable {

    enum ProductDetailsType: String, Codable, Equatable, CaseIterable {
        case product = "product"
    }

    let attributeValues: AttributeValues?
    let attributes: ProductDetailAttributes?
    let availability: ProductAvailabilityTag?
    let category: Category
    /// A boolean that indicates whether or not the current product has similar products.
    let hasSimilarProducts: Bool?
    let id: String
    let images: [String]
    let information: [Information]
    let limitedEdition: String?
    let masterId: String?
    let name: String
    let price: Price?
    let sku: String
    let type: ProductDetailsType
    let video: ProductVideo?

    enum CodingKeys: String, CodingKey {
        case attributeValues = "attributeValues"
        case attributes = "attributes"
        case availability = "availability"
        case category = "category"
        case hasSimilarProducts = "hasSimilarProducts"
        case id = "id"
        case images = "images"
        case information = "information"
        case limitedEdition = "limitedEdition"
        case masterId = "masterId"
        case name = "name"
        case price = "price"
        case sku = "sku"
        case type = "type"
        case video = "video"
    }

    init(attributeValues: AttributeValues? = nil, attributes: ProductDetailAttributes? = nil, availability: ProductAvailabilityTag? = nil, category: Category, hasSimilarProducts: Bool? = nil, id: String, images: [String], information: [Information], limitedEdition: String? = nil, masterId: String? = nil, name: String, price: Price? = nil, sku: String, type: ProductDetailsType, video: ProductVideo? = nil) {
        self.attributeValues = attributeValues
        self.attributes = attributes
        self.availability = availability
        self.category = category
        self.hasSimilarProducts = hasSimilarProducts
        self.id = id
        self.images = images
        self.information = information
        self.limitedEdition = limitedEdition
        self.masterId = masterId
        self.name = name
        self.price = price
        self.sku = sku
        self.type = type
        self.video = video
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributeValues = try container.mkDecodeIfPresent(AttributeValues.self, forKey: .attributeValues)
        self.attributes = try container.mkDecodeIfPresent(ProductDetailAttributes.self, forKey: .attributes)
        self.availability = try container.mkDecodeIfPresent(ProductAvailabilityTag.self, forKey: .availability)
        self.category = try container.mkDecode(Category.self, forKey: .category)
        self.hasSimilarProducts = try container.mkDecodeIfPresent(Bool.self, forKey: .hasSimilarProducts)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.images = try container.mkDecode([String].self, forKey: .images)
        self.information = try container.mkDecode([Information].self, forKey: .information)
        self.limitedEdition = try container.mkDecodeIfPresent(String.self, forKey: .limitedEdition)
        self.masterId = try container.mkDecodeIfPresent(String.self, forKey: .masterId)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.price = try container.mkDecodeIfPresent(Price.self, forKey: .price)
        self.sku = try container.mkDecode(String.self, forKey: .sku)
        self.type = try container.mkDecode(ProductDetailsType.self, forKey: .type)
        self.video = try container.mkDecodeIfPresent(ProductVideo.self, forKey: .video)
    }
}
