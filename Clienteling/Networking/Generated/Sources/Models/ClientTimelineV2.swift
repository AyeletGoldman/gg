/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientTimelineV2: Codable, Equatable {

    enum ClientTimelineV2Timeline: Codable, Equatable {
        case timelineAppointmentEntry(TimelineAppointmentEntry)
        case timelineCaseEntry(TimelineCaseEntry)
        case timelineInteractionEntry(TimelineInteractionEntry)
        case timelineNewsletterEntry(TimelineNewsletterEntry)
        case timelineNpsEntry(TimelineNpsEntry)
        case timelineTransactionEntry(TimelineTransactionEntry)

        enum CodingKeys: String, CodingKey {
            case type = "type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let discriminator = try container.decode(String.self, forKey: .type)
            switch discriminator {
                case "appointment":
                    self = try .timelineAppointmentEntry(TimelineAppointmentEntry(from: decoder))
                case "case":
                    self = try .timelineCaseEntry(TimelineCaseEntry(from: decoder))
                case "interaction":
                    self = try .timelineInteractionEntry(TimelineInteractionEntry(from: decoder))
                case "newsletter":
                    self = try .timelineNewsletterEntry(TimelineNewsletterEntry(from: decoder))
                case "nps":
                    self = try .timelineNpsEntry(TimelineNpsEntry(from: decoder))
                case "refund":
                    self = try .timelineTransactionEntry(TimelineTransactionEntry(from: decoder))
                case "transaction":
                    self = try .timelineTransactionEntry(TimelineTransactionEntry(from: decoder))
                default:
                    throw DecodingError.typeMismatch(ClientTimelineV2Timeline.self, 
                                                        DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
                }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
                case .timelineAppointmentEntry(let wrapped):
                    try wrapped.encode(to: encoder)
                case .timelineCaseEntry(let wrapped):
                    try wrapped.encode(to: encoder)
                case .timelineInteractionEntry(let wrapped):
                    try wrapped.encode(to: encoder)
                case .timelineNewsletterEntry(let wrapped):
                    try wrapped.encode(to: encoder)
                case .timelineNpsEntry(let wrapped):
                    try wrapped.encode(to: encoder)
                case .timelineTransactionEntry(let wrapped):
                    try wrapped.encode(to: encoder)
            }
        }
    }

    let timeline: [ClientTimelineV2Timeline]

    enum CodingKeys: String, CodingKey {
        case timeline = "timeline"
    }

    init(timeline: [ClientTimelineV2Timeline]) {
        self.timeline = timeline
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timeline = try container.mkDecode([ClientTimelineV2Timeline].self, forKey: .timeline)
    }
}
