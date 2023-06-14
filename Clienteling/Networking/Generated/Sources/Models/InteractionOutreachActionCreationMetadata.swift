/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionOutreachActionCreationMetadata: Codable, Equatable {

    enum InteractionOutreachActionCreationMetadataContext: String, Codable, Equatable, CaseIterable {
        case outreachAction = "outreachAction"
    }

    enum InteractionOutreachActionCreationMetadataAction: String, Codable, Equatable, CaseIterable {
        case visit = "visit"
        case alterationsTailoring = "alterationsTailoring"
        case preOrder = "preOrder"
        case booking = "booking"
        case gift = "gift"
        case afterSales = "afterSales"
        case instorePickup = "instorePickup"
        case delivery = "delivery"
    }

    let action: InteractionOutreachActionCreationMetadataAction
    let context: InteractionOutreachActionCreationMetadataContext
    let subject: String?

    enum CodingKeys: String, CodingKey {
        case action = "action"
        case context = "context"
        case subject = "subject"
    }

    init(action: InteractionOutreachActionCreationMetadataAction, context: InteractionOutreachActionCreationMetadataContext, subject: String? = nil) {
        self.action = action
        self.context = context
        self.subject = subject
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.mkDecode(InteractionOutreachActionCreationMetadataAction.self, forKey: .action)
        self.context = try container.mkDecode(InteractionOutreachActionCreationMetadataContext.self, forKey: .context)
        self.subject = try container.mkDecodeIfPresent(String.self, forKey: .subject)
    }
}
