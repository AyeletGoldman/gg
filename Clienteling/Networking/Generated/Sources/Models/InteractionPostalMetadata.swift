/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionPostalMetadata: Codable, Equatable {

    enum InteractionPostalMetadataContext: String, Codable, Equatable, CaseIterable {
        case postal = "postal"
    }

    /// Translation key of the action
    let actionType: String?
    let context: InteractionPostalMetadataContext
    /// A custom note left by the CA to explain this postal interaction
    let note: String?

    enum CodingKeys: String, CodingKey {
        case actionType = "actionType"
        case context = "context"
        case note = "note"
    }

    init(actionType: String? = nil, context: InteractionPostalMetadataContext, note: String? = nil) {
        self.actionType = actionType
        self.context = context
        self.note = note
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actionType = try container.mkDecodeIfPresent(String.self, forKey: .actionType)
        self.context = try container.mkDecode(InteractionPostalMetadataContext.self, forKey: .context)
        self.note = try container.mkDecodeIfPresent(String.self, forKey: .note)
    }
}
