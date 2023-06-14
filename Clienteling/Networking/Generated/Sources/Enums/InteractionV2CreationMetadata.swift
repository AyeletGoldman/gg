/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

enum InteractionV2CreationMetadata: Codable, Equatable {
    case interactionConsultationCreationMetadata(InteractionConsultationCreationMetadata)
    case interactionOutreachActionCreationMetadata(InteractionOutreachActionCreationMetadata)
    case interactionOutreachCreationMetadata(InteractionOutreachCreationMetadata)
    case interactionPayByLinkCreationMetadata(InteractionPayByLinkCreationMetadata)
    case interactionPostalCreationMetadata(InteractionPostalCreationMetadata)
    case interactionProductCuratorCreationMetadata(InteractionProductCuratorCreationMetadata)
    case interactionProductShareCreationMetadata(InteractionProductShareCreationMetadata)

    enum CodingKeys: String, CodingKey {
        case context = "context"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(String.self, forKey: .context)
        switch discriminator {
            case "outreachAction":
                self = try .interactionOutreachActionCreationMetadata(InteractionOutreachActionCreationMetadata(from: decoder))
            case "outreachTemplate":
                self = try .interactionOutreachCreationMetadata(InteractionOutreachCreationMetadata(from: decoder))
            case "paymentLink":
                self = try .interactionPayByLinkCreationMetadata(InteractionPayByLinkCreationMetadata(from: decoder))
            case "postal":
                self = try .interactionPostalCreationMetadata(InteractionPostalCreationMetadata(from: decoder))
            case "productCurator":
                self = try .interactionProductCuratorCreationMetadata(InteractionProductCuratorCreationMetadata(from: decoder))
            case "productShare":
                self = try .interactionProductShareCreationMetadata(InteractionProductShareCreationMetadata(from: decoder))
            case "virtualConsultation":
                self = try .interactionConsultationCreationMetadata(InteractionConsultationCreationMetadata(from: decoder))
            default:
                throw DecodingError.typeMismatch(InteractionV2CreationMetadata.self, 
                                                    DecodingError.Context(codingPath: [], debugDescription: "Could not find discriminator for item"))
            }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
            case .interactionConsultationCreationMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionOutreachActionCreationMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionOutreachCreationMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionPayByLinkCreationMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionPostalCreationMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionProductCuratorCreationMetadata(let wrapped):
                try wrapped.encode(to: encoder)
            case .interactionProductShareCreationMetadata(let wrapped):
                try wrapped.encode(to: encoder)
        }
    }
}
