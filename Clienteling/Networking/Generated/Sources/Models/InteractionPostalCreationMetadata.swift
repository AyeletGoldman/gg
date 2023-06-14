/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionPostalCreationMetadata: Codable, Equatable {

    enum InteractionPostalCreationMetadataContext: String, Codable, Equatable, CaseIterable {
        case postal = "postal"
    }

    enum InteractionPostalCreationMetadataActionType: String, Codable, Equatable, CaseIterable {
        case visit = "visit"
        case booking = "booking"
        case preOrder = "preOrder"
        case alterationsTailoring = "alterationsTailoring"
        case afterSales = "afterSales"
        case gift = "gift"
        case instorePickup = "instorePickup"
        case delivery = "delivery"
    }

    let actionType: InteractionPostalCreationMetadataActionType?
    let context: InteractionPostalCreationMetadataContext
    /// A custom note left by the CA to explain this postal interaction
    let note: String?

    enum CodingKeys: String, CodingKey {
        case actionType = "actionType"
        case context = "context"
        case note = "note"
    }

    init(actionType: InteractionPostalCreationMetadataActionType? = nil, context: InteractionPostalCreationMetadataContext, note: String? = nil) {
        self.actionType = actionType
        self.context = context
        self.note = note
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actionType = try container.mkDecodeIfPresent(InteractionPostalCreationMetadataActionType.self, forKey: .actionType)
        self.context = try container.mkDecode(InteractionPostalCreationMetadataContext.self, forKey: .context)
        self.note = try container.mkDecodeIfPresent(String.self, forKey: .note)
    }
}
