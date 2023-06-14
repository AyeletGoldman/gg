/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ColorAttributeImageUrl: Codable, Equatable {

    enum ColorAttributeImageUrlType: String, Codable, Equatable, CaseIterable {
        case url = "url"
    }

    let imageUrl: URL
    let type: ColorAttributeImageUrlType

    enum CodingKeys: String, CodingKey {
        case imageUrl = "imageUrl"
        case type = "type"
    }

    init(imageUrl: URL, type: ColorAttributeImageUrlType) {
        self.imageUrl = imageUrl
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageUrl = try container.mkDecode(URL.self, forKey: .imageUrl)
        self.type = try container.mkDecode(ColorAttributeImageUrlType.self, forKey: .type)
    }
}
