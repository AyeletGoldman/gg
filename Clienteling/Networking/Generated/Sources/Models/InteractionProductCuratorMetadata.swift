/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionProductCuratorMetadata: Codable, Equatable {

    enum InteractionProductCuratorMetadataContext: String, Codable, Equatable, CaseIterable {
        case productCurator = "productCurator"
    }

    let context: InteractionProductCuratorMetadataContext
    let products: [InteractionMetadataProduct]

    enum CodingKeys: String, CodingKey {
        case context = "context"
        case products = "products"
    }

    init(context: InteractionProductCuratorMetadataContext, products: [InteractionMetadataProduct]) {
        self.context = context
        self.products = products
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.mkDecode(InteractionProductCuratorMetadataContext.self, forKey: .context)
        self.products = try container.mkDecode([InteractionMetadataProduct].self, forKey: .products)
    }
}
