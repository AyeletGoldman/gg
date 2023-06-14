/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionProductShareMetadata: Codable, Equatable {

    enum InteractionProductShareMetadataContext: String, Codable, Equatable, CaseIterable {
        case productShare = "productShare"
    }

    let context: InteractionProductShareMetadataContext
    let product: InteractionMetadataProduct

    enum CodingKeys: String, CodingKey {
        case context = "context"
        case product = "product"
    }

    init(context: InteractionProductShareMetadataContext, product: InteractionMetadataProduct) {
        self.context = context
        self.product = product
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.mkDecode(InteractionProductShareMetadataContext.self, forKey: .context)
        self.product = try container.mkDecode(InteractionMetadataProduct.self, forKey: .product)
    }
}
