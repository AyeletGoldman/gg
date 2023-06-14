/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum ColorHexOrURL: Codable, Equatable {
    case colorAttributeHexCode(ColorAttributeHexCode)
    case colorAttributeImageUrl(ColorAttributeImageUrl)

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(String.self, forKey: .type)
        switch discriminator {
            case "hexCode":
                self = try .colorAttributeHexCode(ColorAttributeHexCode(from: decoder))
            case "url":
                self = try .colorAttributeImageUrl(ColorAttributeImageUrl(from: decoder))
            default:
                throw DecodingError.typeMismatch(ColorHexOrURL.self, 
                                                    DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
            }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .colorAttributeHexCode(let wrapped):
                try wrapped.encode(to: encoder)
            case .colorAttributeImageUrl(let wrapped):
                try wrapped.encode(to: encoder)
        }
    }
}
