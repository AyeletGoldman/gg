/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientListHeader: Codable, Equatable {

    let caption: String?
    let description: String?
    let imageURL: URL?
    let listType: ListType
    let membersType: MembersType
    let tag: String?
    let title: String

    enum CodingKeys: String, CodingKey {
        case caption = "caption"
        case description = "description"
        case imageURL = "imageURL"
        case listType = "listType"
        case membersType = "membersType"
        case tag = "tag"
        case title = "title"
    }

    init(caption: String? = nil, description: String? = nil, imageURL: URL? = nil, listType: ListType, membersType: MembersType, tag: String? = nil, title: String) {
        self.caption = caption
        self.description = description
        self.imageURL = imageURL
        self.listType = listType
        self.membersType = membersType
        self.tag = tag
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.caption = try container.mkDecodeIfPresent(String.self, forKey: .caption)
        self.description = try container.mkDecodeIfPresent(String.self, forKey: .description)
        self.imageURL = try container.mkDecodeIfPresent(URL.self, forKey: .imageURL)
        self.listType = try container.mkDecode(ListType.self, forKey: .listType)
        self.membersType = try container.mkDecode(MembersType.self, forKey: .membersType)
        self.tag = try container.mkDecodeIfPresent(String.self, forKey: .tag)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
