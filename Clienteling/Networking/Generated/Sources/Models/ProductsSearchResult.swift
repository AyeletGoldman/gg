/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ProductsSearchResult: Codable, Equatable {

    enum ProductsSearchResultProducts: Codable, Equatable {
        case masterSummary(MasterSummary)
        case productSummary(ProductSummary)

        enum CodingKeys: String, CodingKey {
            case type = "type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let discriminator = try container.decode(String.self, forKey: .type)
            switch discriminator {
                case "master":
                    self = try .masterSummary(MasterSummary(from: decoder))
                case "product":
                    self = try .productSummary(ProductSummary(from: decoder))
                default:
                    throw DecodingError.typeMismatch(ProductsSearchResultProducts.self, 
                                                        DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
                }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
                case .masterSummary(let wrapped):
                    try wrapped.encode(to: encoder)
                case .productSummary(let wrapped):
                    try wrapped.encode(to: encoder)
            }
        }
    }

    let filters: Filters
    let pagination: Pagination
    let products: [ProductsSearchResultProducts]
    let sort: Sorts?

    enum CodingKeys: String, CodingKey {
        case filters = "filters"
        case pagination = "pagination"
        case products = "products"
        case sort = "sort"
    }

    init(filters: Filters, pagination: Pagination, products: [ProductsSearchResultProducts], sort: Sorts? = nil) {
        self.filters = filters
        self.pagination = pagination
        self.products = products
        self.sort = sort
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.filters = try container.mkDecode(Filters.self, forKey: .filters)
        self.pagination = try container.mkDecode(Pagination.self, forKey: .pagination)
        self.products = try container.mkDecode([ProductsSearchResultProducts].self, forKey: .products)
        self.sort = try container.mkDecodeIfPresent(Sorts.self, forKey: .sort)
    }
}
