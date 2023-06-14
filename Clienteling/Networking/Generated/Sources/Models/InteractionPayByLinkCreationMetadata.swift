/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionPayByLinkCreationMetadata: Codable, Equatable {

    enum InteractionPayByLinkCreationMetadataContext: String, Codable, Equatable, CaseIterable {
        case paymentLink = "paymentLink"
    }

    let context: InteractionPayByLinkCreationMetadataContext
    let paymentLinkId: String

    enum CodingKeys: String, CodingKey {
        case context = "context"
        case paymentLinkId = "paymentLinkId"
    }

    init(context: InteractionPayByLinkCreationMetadataContext, paymentLinkId: String) {
        self.context = context
        self.paymentLinkId = paymentLinkId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.mkDecode(InteractionPayByLinkCreationMetadataContext.self, forKey: .context)
        self.paymentLinkId = try container.mkDecode(String.self, forKey: .paymentLinkId)
    }
}
