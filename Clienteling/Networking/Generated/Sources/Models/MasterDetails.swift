/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct MasterDetails: Codable, Equatable {

    enum MasterDetailsType: String, Codable, Equatable, CaseIterable {
        case master = "master"
    }

    struct MasterDetailsPriceRange: Codable, Equatable {

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

    let attributeValues: AttributeValues?
    let attributes: ProductDetailAttributes
    let availability: ProductAvailabilityTag?
    let category: Category
    /// A boolean that indicates whether or not the current product has similar products.
    let hasSimilarProducts: Bool?
    let id: String
    let images: [String]
    let information: [Information]
    let name: String
    let priceRange: MasterDetailsPriceRange?
    let type: MasterDetailsType
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
        case name = "name"
        case priceRange = "priceRange"
        case type = "type"
        case video = "video"
    }

    init(attributeValues: AttributeValues? = nil, attributes: ProductDetailAttributes, availability: ProductAvailabilityTag? = nil, category: Category, hasSimilarProducts: Bool? = nil, id: String, images: [String], information: [Information], name: String, priceRange: MasterDetailsPriceRange? = nil, type: MasterDetailsType, video: ProductVideo? = nil) {
        self.attributeValues = attributeValues
        self.attributes = attributes
        self.availability = availability
        self.category = category
        self.hasSimilarProducts = hasSimilarProducts
        self.id = id
        self.images = images
        self.information = information
        self.name = name
        self.priceRange = priceRange
        self.type = type
        self.video = video
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributeValues = try container.mkDecodeIfPresent(AttributeValues.self, forKey: .attributeValues)
        self.attributes = try container.mkDecode(ProductDetailAttributes.self, forKey: .attributes)
        self.availability = try container.mkDecodeIfPresent(ProductAvailabilityTag.self, forKey: .availability)
        self.category = try container.mkDecode(Category.self, forKey: .category)
        self.hasSimilarProducts = try container.mkDecodeIfPresent(Bool.self, forKey: .hasSimilarProducts)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.images = try container.mkDecode([String].self, forKey: .images)
        self.information = try container.mkDecode([Information].self, forKey: .information)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.priceRange = try container.mkDecodeIfPresent(MasterDetailsPriceRange.self, forKey: .priceRange)
        self.type = try container.mkDecode(MasterDetailsType.self, forKey: .type)
        self.video = try container.mkDecodeIfPresent(ProductVideo.self, forKey: .video)
    }
}
