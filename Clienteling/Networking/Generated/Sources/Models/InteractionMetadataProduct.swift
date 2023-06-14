/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct InteractionMetadataProduct: Codable, Equatable {

    let productAssetURLs: [MediaAsset]
    let productId: String
    let productImageURLs: [URL]
    let productName: String

    enum CodingKeys: String, CodingKey {
        case productAssetURLs = "productAssetURLs"
        case productId = "productId"
        case productImageURLs = "productImageURLs"
        case productName = "productName"
    }

    init(productAssetURLs: [MediaAsset], productId: String, productImageURLs: [URL], productName: String) {
        self.productAssetURLs = productAssetURLs
        self.productId = productId
        self.productImageURLs = productImageURLs
        self.productName = productName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productAssetURLs = try container.mkDecode([MediaAsset].self, forKey: .productAssetURLs)
        self.productId = try container.mkDecode(String.self, forKey: .productId)
        self.productImageURLs = try container.mkDecode([URL].self, forKey: .productImageURLs)
        self.productName = try container.mkDecode(String.self, forKey: .productName)
    }
}
