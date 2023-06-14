/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// An object that holds the product video

struct ProductVideo: Codable, Equatable {

    /// A custom thumbnail to use for the product video
    let thumbnail: URL?
    /// The URL of the product video
    let url: URL

    enum CodingKeys: String, CodingKey {
        case thumbnail = "thumbnail"
        case url = "url"
    }

    init(thumbnail: URL? = nil, url: URL) {
        self.thumbnail = thumbnail
        self.url = url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.thumbnail = try container.mkDecodeIfPresent(URL.self, forKey: .thumbnail)
        self.url = try container.mkDecode(URL.self, forKey: .url)
    }
}
