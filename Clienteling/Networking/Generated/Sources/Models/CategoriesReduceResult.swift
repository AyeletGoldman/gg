/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CategoriesReduceResult: Codable, Equatable {

    enum CategoriesReduceResultItems: Codable, Equatable {
        case cardItems(CardItems)
        case textItems(TextItems)

        enum CodingKeys: String, CodingKey {
            case display = "display"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let discriminator = try container.decode(String.self, forKey: .display)
            switch discriminator {
                case "card":
                    self = try .cardItems(CardItems(from: decoder))
                case "text":
                    self = try .textItems(TextItems(from: decoder))
                default:
                    throw DecodingError.typeMismatch(CategoriesReduceResultItems.self, 
                                                        DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
                }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
                case .cardItems(let wrapped):
                    try wrapped.encode(to: encoder)
                case .textItems(let wrapped):
                    try wrapped.encode(to: encoder)
            }
        }
    }

    let categoryId: String
    let categoryName: String
    let items: CategoriesReduceResultItems

    enum CodingKeys: String, CodingKey {
        case categoryId = "categoryId"
        case categoryName = "categoryName"
        case items = "items"
    }

    init(categoryId: String, categoryName: String, items: CategoriesReduceResultItems) {
        self.categoryId = categoryId
        self.categoryName = categoryName
        self.items = items
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.categoryId = try container.mkDecode(String.self, forKey: .categoryId)
        self.categoryName = try container.mkDecode(String.self, forKey: .categoryName)
        self.items = try container.mkDecode(CategoriesReduceResultItems.self, forKey: .items)
    }
}
