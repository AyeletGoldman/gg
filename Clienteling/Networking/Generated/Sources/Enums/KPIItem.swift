/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum KPIItem: Codable, Equatable {
    case nPSScoreKPI(NPSScoreKPI)
    case typedValue(TypedValue)

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(String.self, forKey: .type)
        switch discriminator {
            case "boolean":
                self = try .typedValue(TypedValue(from: decoder))
            case "currency":
                self = try .typedValue(TypedValue(from: decoder))
            case "date":
                self = try .typedValue(TypedValue(from: decoder))
            case "datetime":
                self = try .typedValue(TypedValue(from: decoder))
            case "multiPicklist":
                self = try .typedValue(TypedValue(from: decoder))
            case "multiText":
                self = try .typedValue(TypedValue(from: decoder))
            case "npsScore":
                self = try .nPSScoreKPI(NPSScoreKPI(from: decoder))
            case "number":
                self = try .typedValue(TypedValue(from: decoder))
            case "picklist":
                self = try .typedValue(TypedValue(from: decoder))
            case "text":
                self = try .typedValue(TypedValue(from: decoder))
            default:
                throw DecodingError.typeMismatch(KPIItem.self, 
                                                    DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
            }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .nPSScoreKPI(let wrapped):
                try wrapped.encode(to: encoder)
            case .typedValue(let wrapped):
                try wrapped.encode(to: encoder)
        }
    }
}
