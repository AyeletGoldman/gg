/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum AvailableFilters: Codable, Equatable {
    case filterImage(FilterImage)
    case filterText(FilterText)

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(String.self, forKey: .type)
        switch discriminator {
            case "images":
                self = try .filterImage(FilterImage(from: decoder))
            case "text":
                self = try .filterText(FilterText(from: decoder))
            default:
                throw DecodingError.typeMismatch(AvailableFilters.self, 
                                                    DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
            }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .filterImage(let wrapped):
                try wrapped.encode(to: encoder)
            case .filterText(let wrapped):
                try wrapped.encode(to: encoder)
        }
    }
}
