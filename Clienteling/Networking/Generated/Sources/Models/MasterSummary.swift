/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct MasterSummary: Codable, Equatable {

    struct MasterSummaryAttributes: Codable, Equatable {

        let displayName: String
        let displayValues: [String]

        enum CodingKeys: String, CodingKey {
            case displayName = "displayName"
            case displayValues = "displayValues"
        }

        init(displayName: String, displayValues: [String]) {
            self.displayName = displayName
            self.displayValues = displayValues
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.displayName = try container.mkDecode(String.self, forKey: .displayName)
            self.displayValues = try container.mkDecode([String].self, forKey: .displayValues)
        }
    }

    struct MasterSummaryPriceRange: Codable, Equatable {

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

    let attributes: [MasterSummaryAttributes]
    let availability: ProductAvailabilityTag?
    let category: Category
    let colorAttribute: ColorAttribute?
    let id: String
    let image: URL
    let name: String
    let priceRange: MasterSummaryPriceRange?
    let shortDescription: String?
    let type: SummaryTypes

    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
        case availability = "availability"
        case category = "category"
        case colorAttribute = "colorAttribute"
        case id = "id"
        case image = "image"
        case name = "name"
        case priceRange = "priceRange"
        case shortDescription = "shortDescription"
        case type = "type"
    }

    init(attributes: [MasterSummaryAttributes], availability: ProductAvailabilityTag? = nil, category: Category, colorAttribute: ColorAttribute? = nil, id: String, image: URL, name: String, priceRange: MasterSummaryPriceRange? = nil, shortDescription: String? = nil, type: SummaryTypes) {
        self.attributes = attributes
        self.availability = availability
        self.category = category
        self.colorAttribute = colorAttribute
        self.id = id
        self.image = image
        self.name = name
        self.priceRange = priceRange
        self.shortDescription = shortDescription
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attributes = try container.mkDecode([MasterSummaryAttributes].self, forKey: .attributes)
        self.availability = try container.mkDecodeIfPresent(ProductAvailabilityTag.self, forKey: .availability)
        self.category = try container.mkDecode(Category.self, forKey: .category)
        self.colorAttribute = try container.mkDecodeIfPresent(ColorAttribute.self, forKey: .colorAttribute)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.image = try container.mkDecode(URL.self, forKey: .image)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.priceRange = try container.mkDecodeIfPresent(MasterSummaryPriceRange.self, forKey: .priceRange)
        self.shortDescription = try container.mkDecodeIfPresent(String.self, forKey: .shortDescription)
        self.type = try container.mkDecode(SummaryTypes.self, forKey: .type)
    }
}
