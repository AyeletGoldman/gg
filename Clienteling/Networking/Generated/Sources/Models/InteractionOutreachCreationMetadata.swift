/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionOutreachCreationMetadata: Codable, Equatable {

    enum InteractionOutreachCreationMetadataContext: String, Codable, Equatable, CaseIterable {
        case outreachTemplate = "outreachTemplate"
    }

    let context: InteractionOutreachCreationMetadataContext
    let templateId: String?

    enum CodingKeys: String, CodingKey {
        case context = "context"
        case templateId = "templateId"
    }

    init(context: InteractionOutreachCreationMetadataContext, templateId: String? = nil) {
        self.context = context
        self.templateId = templateId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.mkDecode(InteractionOutreachCreationMetadataContext.self, forKey: .context)
        self.templateId = try container.mkDecodeIfPresent(String.self, forKey: .templateId)
    }
}
