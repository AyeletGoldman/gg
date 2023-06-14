/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum AttributeValueItem: Codable, Equatable {
    case attributeValueItemHexColor(AttributeValueItemHexColor)
    case attributeValueItemImageUrl(AttributeValueItemImageUrl)
    case attributeValueItemStringValue(AttributeValueItemStringValue)

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(String.self, forKey: .type)
        switch discriminator {
            case "hexCode":
                self = try .attributeValueItemHexColor(AttributeValueItemHexColor(from: decoder))
            case "imageUrl":
                self = try .attributeValueItemImageUrl(AttributeValueItemImageUrl(from: decoder))
            case "string":
                self = try .attributeValueItemStringValue(AttributeValueItemStringValue(from: decoder))
            default:
                throw DecodingError.typeMismatch(AttributeValueItem.self, 
                                                    DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
            }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .attributeValueItemHexColor(let wrapped):
                try wrapped.encode(to: encoder)
            case .attributeValueItemImageUrl(let wrapped):
                try wrapped.encode(to: encoder)
            case .attributeValueItemStringValue(let wrapped):
                try wrapped.encode(to: encoder)
        }
    }
}
