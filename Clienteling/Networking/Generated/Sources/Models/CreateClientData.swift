/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateClientData: Codable, Equatable {

    enum CreateClientDataCustomFields: Codable, Equatable {
        case createClientCustomFieldBoolean(CreateClientCustomFieldBoolean)
        case createClientCustomFieldDate(CreateClientCustomFieldDate)
        case createClientCustomFieldNumber(CreateClientCustomFieldNumber)
        case createClientCustomFieldString(CreateClientCustomFieldString)

        enum CodingKeys: String, CodingKey {
            case type = "type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let discriminator = try container.decode(String.self, forKey: .type)
            switch discriminator {
                case "boolean":
                    self = try .createClientCustomFieldBoolean(CreateClientCustomFieldBoolean(from: decoder))
                case "date":
                    self = try .createClientCustomFieldDate(CreateClientCustomFieldDate(from: decoder))
                case "number":
                    self = try .createClientCustomFieldNumber(CreateClientCustomFieldNumber(from: decoder))
                case "string":
                    self = try .createClientCustomFieldString(CreateClientCustomFieldString(from: decoder))
                default:
                    throw DecodingError.typeMismatch(CreateClientDataCustomFields.self, 
                                                        DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
                }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
                case .createClientCustomFieldBoolean(let wrapped):
                    try wrapped.encode(to: encoder)
                case .createClientCustomFieldDate(let wrapped):
                    try wrapped.encode(to: encoder)
                case .createClientCustomFieldNumber(let wrapped):
                    try wrapped.encode(to: encoder)
                case .createClientCustomFieldString(let wrapped):
                    try wrapped.encode(to: encoder)
            }
        }
    }

    let customFields: [CreateClientDataCustomFields]?

    enum CodingKeys: String, CodingKey {
        case customFields = "customFields"
    }

    init(customFields: [CreateClientDataCustomFields]? = nil) {
        self.customFields = customFields
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.customFields = try container.mkDecodeIfPresent([CreateClientDataCustomFields].self, forKey: .customFields)
    }
}
