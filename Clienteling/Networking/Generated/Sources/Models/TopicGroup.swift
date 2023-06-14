/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TopicGroup: Codable, Equatable {

    /// Description of the group
    let description: String?
    /// Id of the group
    let id: String
    /// Title of the group
    let title: String

    enum CodingKeys: String, CodingKey {
        case description = "description"
        case id = "id"
        case title = "title"
    }

    init(description: String? = nil, id: String, title: String) {
        self.description = description
        self.id = id
        self.title = title
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.mkDecodeIfPresent(String.self, forKey: .description)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.title = try container.mkDecode(String.self, forKey: .title)
    }
}
