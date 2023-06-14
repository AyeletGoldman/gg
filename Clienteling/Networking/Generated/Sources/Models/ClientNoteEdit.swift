/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientNoteEdit: Codable, Equatable {

    let advisorId: String
    let content: String
    let storeId: String

    enum CodingKeys: String, CodingKey {
        case advisorId = "advisorId"
        case content = "content"
        case storeId = "storeId"
    }

    init(advisorId: String, content: String, storeId: String) {
        self.advisorId = advisorId
        self.content = content
        self.storeId = storeId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorId = try container.mkDecode(String.self, forKey: .advisorId)
        self.content = try container.mkDecode(String.self, forKey: .content)
        self.storeId = try container.mkDecode(String.self, forKey: .storeId)
    }
}
