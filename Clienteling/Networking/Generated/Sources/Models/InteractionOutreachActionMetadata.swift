/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionOutreachActionMetadata: Codable, Equatable {

    enum InteractionOutreachActionMetadataContext: String, Codable, Equatable, CaseIterable {
        case outreachAction = "outreachAction"
    }

    enum InteractionOutreachActionMetadataAction: String, Codable, Equatable, CaseIterable {
        case visit = "visit"
        case alterationsTailoring = "alterationsTailoring"
        case preOrder = "preOrder"
        case booking = "booking"
        case gift = "gift"
        case afterSales = "afterSales"
        case instorePickup = "instorePickup"
        case delivery = "delivery"
    }

    let action: InteractionOutreachActionMetadataAction
    let actionTitle: String
    let context: InteractionOutreachActionMetadataContext
    let subject: String?

    enum CodingKeys: String, CodingKey {
        case action = "action"
        case actionTitle = "actionTitle"
        case context = "context"
        case subject = "subject"
    }

    init(action: InteractionOutreachActionMetadataAction, actionTitle: String, context: InteractionOutreachActionMetadataContext, subject: String? = nil) {
        self.action = action
        self.actionTitle = actionTitle
        self.context = context
        self.subject = subject
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.mkDecode(InteractionOutreachActionMetadataAction.self, forKey: .action)
        self.actionTitle = try container.mkDecode(String.self, forKey: .actionTitle)
        self.context = try container.mkDecode(InteractionOutreachActionMetadataContext.self, forKey: .context)
        self.subject = try container.mkDecodeIfPresent(String.self, forKey: .subject)
    }
}
