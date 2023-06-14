/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientTimelineV1: Codable, Equatable {

    enum ClientTimelineV1Timeline: Codable, Equatable {
        case interactionV1(InteractionV1)
        case newsletterV1(NewsletterV1)
        case transactionV1(TransactionV1)

        enum CodingKeys: String, CodingKey {
            case type = "type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let discriminator = try container.decode(String.self, forKey: .type)
            switch discriminator {
                case "Interactions":
                    self = try .interactionV1(InteractionV1(from: decoder))
                case "Newsletters":
                    self = try .newsletterV1(NewsletterV1(from: decoder))
                case "Transactions":
                    self = try .transactionV1(TransactionV1(from: decoder))
                default:
                    throw DecodingError.typeMismatch(ClientTimelineV1Timeline.self, 
                                                        DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
                }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
                case .interactionV1(let wrapped):
                    try wrapped.encode(to: encoder)
                case .newsletterV1(let wrapped):
                    try wrapped.encode(to: encoder)
                case .transactionV1(let wrapped):
                    try wrapped.encode(to: encoder)
            }
        }
    }

    let timeline: [ClientTimelineV1Timeline]

    enum CodingKeys: String, CodingKey {
        case timeline = "timeline"
    }

    init(timeline: [ClientTimelineV1Timeline]) {
        self.timeline = timeline
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timeline = try container.mkDecode([ClientTimelineV1Timeline].self, forKey: .timeline)
    }
}
