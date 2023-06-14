/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// A response when requesting for an array of product ids.

struct ProductsDetailsResult: Codable, Equatable {

    /// A response when requesting for an array of product ids.
    enum ProductsDetailsResultProducts: Codable, Equatable {
        case masterDetails(MasterDetails)
        case productDetails(ProductDetails)

        enum CodingKeys: String, CodingKey {
            case type = "type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let discriminator = try container.decode(String.self, forKey: .type)
            switch discriminator {
                case "master":
                    self = try .masterDetails(MasterDetails(from: decoder))
                case "product":
                    self = try .productDetails(ProductDetails(from: decoder))
                default:
                    throw DecodingError.typeMismatch(ProductsDetailsResultProducts.self, 
                                                        DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
                }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
                case .masterDetails(let wrapped):
                    try wrapped.encode(to: encoder)
                case .productDetails(let wrapped):
                    try wrapped.encode(to: encoder)
            }
        }
    }

    let products: [ProductsDetailsResultProducts]

    enum CodingKeys: String, CodingKey {
        case products = "products"
    }

    init(products: [ProductsDetailsResultProducts]) {
        self.products = products
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.products = try container.mkDecode([ProductsDetailsResultProducts].self, forKey: .products)
    }
}
