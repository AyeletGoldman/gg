/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TransactionItem: Codable, Equatable {

    let headline: String?
    let id: String
    let imageURL: URL?
    let imageURLs: [URL]?
    let name: String
    let price: TypedValue
    let sku: String
    let specifications: [TypedValue]?

    enum CodingKeys: String, CodingKey {
        case headline = "headline"
        case id = "id"
        case imageURL = "imageURL"
        case imageURLs = "imageURLs"
        case name = "name"
        case price = "price"
        case sku = "sku"
        case specifications = "specifications"
    }

    init(headline: String? = nil, id: String, imageURL: URL? = nil, imageURLs: [URL]? = nil, name: String, price: TypedValue, sku: String, specifications: [TypedValue]? = nil) {
        self.headline = headline
        self.id = id
        self.imageURL = imageURL
        self.imageURLs = imageURLs
        self.name = name
        self.price = price
        self.sku = sku
        self.specifications = specifications
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.headline = try container.mkDecodeIfPresent(String.self, forKey: .headline)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.imageURL = try container.mkDecodeIfPresent(URL.self, forKey: .imageURL)
        self.imageURLs = try container.mkDecodeIfPresent([URL].self, forKey: .imageURLs)
        self.name = try container.mkDecode(String.self, forKey: .name)
        self.price = try container.mkDecode(TypedValue.self, forKey: .price)
        self.sku = try container.mkDecode(String.self, forKey: .sku)
        self.specifications = try container.mkDecodeIfPresent([TypedValue].self, forKey: .specifications)
    }
}
