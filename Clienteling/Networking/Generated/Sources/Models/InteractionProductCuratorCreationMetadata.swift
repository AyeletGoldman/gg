/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionProductCuratorCreationMetadata: Codable, Equatable {

    enum InteractionProductCuratorCreationMetadataContext: String, Codable, Equatable, CaseIterable {
        case productCurator = "productCurator"
    }

    let context: InteractionProductCuratorCreationMetadataContext
    let curationId: String?
    let productIds: [String]

    enum CodingKeys: String, CodingKey {
        case context = "context"
        case curationId = "curationId"
        case productIds = "productIds"
    }

    init(context: InteractionProductCuratorCreationMetadataContext, curationId: String? = nil, productIds: [String]) {
        self.context = context
        self.curationId = curationId
        self.productIds = productIds
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.context = try container.mkDecode(InteractionProductCuratorCreationMetadataContext.self, forKey: .context)
        self.curationId = try container.mkDecodeIfPresent(String.self, forKey: .curationId)
        self.productIds = try container.mkDecode([String].self, forKey: .productIds)
    }
}
