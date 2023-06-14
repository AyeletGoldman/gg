/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PatchProductCurationItem: Codable, Equatable {

    let assets: [PatchAsset]?
    let productId: String

    enum CodingKeys: String, CodingKey {
        case assets = "assets"
        case productId = "productId"
    }

    init(assets: [PatchAsset]? = nil, productId: String) {
        self.assets = assets
        self.productId = productId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assets = try container.mkDecodeIfPresent([PatchAsset].self, forKey: .assets)
        self.productId = try container.mkDecode(String.self, forKey: .productId)
    }
}
