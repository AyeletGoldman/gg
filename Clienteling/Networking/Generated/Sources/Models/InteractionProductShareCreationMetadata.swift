/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionProductShareCreationMetadata: Codable, Equatable {

    enum InteractionProductShareCreationMetadataContext: String, Codable, Equatable, CaseIterable {
        case productShare = "productShare"
    }

    let context: InteractionProductShareCreationMetadataContext
    /// The ID of the product that was shared.
    let productId: String

    enum CodingKeys: String, CodingKey {
        case context = "context"
        case productId = "productId"
    }

    init(context: InteractionProductShareCreationMetadataContext, productId: String) {
        self.context = context
        self.productId = productId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.mkDecode(InteractionProductShareCreationMetadataContext.self, forKey: .context)
        self.productId = try container.mkDecode(String.self, forKey: .productId)
    }
}
