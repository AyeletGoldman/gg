/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum TypedValue: Codable, Equatable {
    case typedValueBoolean(TypedValueBoolean)
    case typedValueCurrency(TypedValueCurrency)
    case typedValueDate(TypedValueDate)
    case typedValueDatetime(TypedValueDatetime)
    case typedValueMultiPicklist(TypedValueMultiPicklist)
    case typedValueMultiText(TypedValueMultiText)
    case typedValueNumber(TypedValueNumber)
    case typedValuePicklist(TypedValuePicklist)
    case typedValueText(TypedValueText)

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(String.self, forKey: .type)
        switch discriminator {
            case "boolean":
                self = try .typedValueBoolean(TypedValueBoolean(from: decoder))
            case "currency":
                self = try .typedValueCurrency(TypedValueCurrency(from: decoder))
            case "date":
                self = try .typedValueDate(TypedValueDate(from: decoder))
            case "datetime":
                self = try .typedValueDatetime(TypedValueDatetime(from: decoder))
            case "multiPicklist":
                self = try .typedValueMultiPicklist(TypedValueMultiPicklist(from: decoder))
            case "multiText":
                self = try .typedValueMultiText(TypedValueMultiText(from: decoder))
            case "number":
                self = try .typedValueNumber(TypedValueNumber(from: decoder))
            case "picklist":
                self = try .typedValuePicklist(TypedValuePicklist(from: decoder))
            case "text":
                self = try .typedValueText(TypedValueText(from: decoder))
            default:
                throw DecodingError.typeMismatch(TypedValue.self, 
                                                    DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
            }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .typedValueBoolean(let wrapped):
                try wrapped.encode(to: encoder)
            case .typedValueCurrency(let wrapped):
                try wrapped.encode(to: encoder)
            case .typedValueDate(let wrapped):
                try wrapped.encode(to: encoder)
            case .typedValueDatetime(let wrapped):
                try wrapped.encode(to: encoder)
            case .typedValueMultiPicklist(let wrapped):
                try wrapped.encode(to: encoder)
            case .typedValueMultiText(let wrapped):
                try wrapped.encode(to: encoder)
            case .typedValueNumber(let wrapped):
                try wrapped.encode(to: encoder)
            case .typedValuePicklist(let wrapped):
                try wrapped.encode(to: encoder)
            case .typedValueText(let wrapped):
                try wrapped.encode(to: encoder)
        }
    }
}
