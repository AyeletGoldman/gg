/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum NotificationMetadata: Codable, Equatable {
    case pblPaymentMadeNotification(PblPaymentMadeNotification)
    case pblURLExpiredNotification(PblURLExpiredNotification)

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(String.self, forKey: .type)
        switch discriminator {
            case "pblPaymentMade":
                self = try .pblPaymentMadeNotification(PblPaymentMadeNotification(from: decoder))
            case "pblURLExpired":
                self = try .pblURLExpiredNotification(PblURLExpiredNotification(from: decoder))
            default:
                throw DecodingError.typeMismatch(NotificationMetadata.self, 
                                                    DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
            }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .pblPaymentMadeNotification(let wrapped):
                try wrapped.encode(to: encoder)
            case .pblURLExpiredNotification(let wrapped):
                try wrapped.encode(to: encoder)
        }
    }
}
