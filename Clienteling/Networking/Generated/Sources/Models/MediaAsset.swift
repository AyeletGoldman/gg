/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct MediaAsset: Codable, Equatable {

    let contentType: String
    let url: URL

    enum CodingKeys: String, CodingKey {
        case contentType = "contentType"
        case url = "url"
    }

    init(contentType: String, url: URL) {
        self.contentType = contentType
        self.url = url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try container.mkDecode(String.self, forKey: .contentType)
        self.url = try container.mkDecode(URL.self, forKey: .url)
    }
}
