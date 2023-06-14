/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum NpsEventSource: Codable, Equatable {
    case sourceEventEcomm(SourceEventEcomm)
    case sourceEventInstore(SourceEventInstore)

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(String.self, forKey: .type)
        switch discriminator {
            case "inStore":
                self = try .sourceEventInstore(SourceEventInstore(from: decoder))
            case "postDelivery":
                self = try .sourceEventEcomm(SourceEventEcomm(from: decoder))
            case "postPayment":
                self = try .sourceEventEcomm(SourceEventEcomm(from: decoder))
            default:
                throw DecodingError.typeMismatch(NpsEventSource.self, 
                                                    DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
            }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .sourceEventEcomm(let wrapped):
                try wrapped.encode(to: encoder)
            case .sourceEventInstore(let wrapped):
                try wrapped.encode(to: encoder)
        }
    }
}
