/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum InteractionV2Metadata: Codable, Equatable {
    case interactionOutreachActionMetadata(InteractionOutreachActionMetadata)
    case interactionOutreachMetadata(InteractionOutreachMetadata)
    case interactionPayByLinkMetadata(InteractionPayByLinkMetadata)
    case interactionPostalMetadata(InteractionPostalMetadata)
    case interactionProductCuratorMetadata(InteractionProductCuratorMetadata)
    case interactionProductShareMetadata(InteractionProductShareMetadata)
    case interactionVirtualConsultationMetadata(InteractionVirtualConsultationMetadata)

    enum CodingKeys: String, CodingKey {
        case context = "context"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(String.self, forKey: .context)
        switch discriminator {
            case "outreachAction":
                self = try .interactionOutreachActionMetadata(InteractionOutreachActionMetadata(from: decoder))
            case "outreachTemplate":
                self = try .interactionOutreachMetadata(InteractionOutreachMetadata(from: decoder))
            case "paymentLink":
                self = try .interactionPayByLinkMetadata(InteractionPayByLinkMetadata(from: decoder))
            case "postal":
                self = try .interactionPostalMetadata(InteractionPostalMetadata(from: decoder))
            case "productCurator":
                self = try .interactionProductCuratorMetadata(InteractionProductCuratorMetadata(from: decoder))
            case "productShare":
                self = try .interactionProductShareMetadata(InteractionProductShareMetadata(from: decoder))
            case "virtualConsultation":
                self = try .interactionVirtualConsultationMetadata(InteractionVirtualConsultationMetadata(from: decoder))
            default:
                throw DecodingError.typeMismatch(InteractionV2Metadata.self, 
                                                    DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
            }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .interactionOutreachActionMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionOutreachMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionPayByLinkMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionPostalMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionProductCuratorMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionProductShareMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionVirtualConsultationMetadata(let wrapped):
                try wrapped.encode(to: encoder)
        }
    }
}
