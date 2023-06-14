/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct UploadAssetBody: Codable, Equatable {

    let assets: [FileUpload]
    let productIds: [String]

    enum CodingKeys: String, CodingKey {
        case assets = "assets"
        case productIds = "productIds"
    }

    init(assets: [FileUpload], productIds: [String]) {
        self.assets = assets
        self.productIds = productIds
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assets = try container.mkDecode([FileUpload].self, forKey: .assets)
        self.productIds = try container.mkDecode([String].self, forKey: .productIds)
    }
}
