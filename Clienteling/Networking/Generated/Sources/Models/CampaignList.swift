/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CampaignList: Codable, Equatable {

    let id: String
    let imageURL: URL
    let subtitle: String?
    let tag: String?
    let title: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "imageURL"
        case subtitle = "subtitle"
        case tag = "tag"
        case title = "title"
    }

    init(id: String, imageURL: URL, subtitle: String? = nil, tag: String? = nil, title: String) {
        self.id = id
        self.imageURL = imageURL
        self.subtitle = subtitle
        self.tag = tag
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.imageURL = try container.mkDecode(URL.self, forKey: .imageURL)
        self.subtitle = try container.mkDecodeIfPresent(String.self, forKey: .subtitle)
        self.tag = try container.mkDecodeIfPresent(String.self, forKey: .tag)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
