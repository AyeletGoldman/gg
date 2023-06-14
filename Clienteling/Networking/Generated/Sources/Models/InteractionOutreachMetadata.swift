/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionOutreachMetadata: Codable, Equatable {

    enum InteractionOutreachMetadataContext: String, Codable, Equatable, CaseIterable {
        case outreachTemplate = "outreachTemplate"
    }

    let context: InteractionOutreachMetadataContext
    let templateName: String?

    enum CodingKeys: String, CodingKey {
        case context = "context"
        case templateName = "templateName"
    }

    init(context: InteractionOutreachMetadataContext, templateName: String? = nil) {
        self.context = context
        self.templateName = templateName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.mkDecode(InteractionOutreachMetadataContext.self, forKey: .context)
        self.templateName = try container.mkDecodeIfPresent(String.self, forKey: .templateName)
    }
}
