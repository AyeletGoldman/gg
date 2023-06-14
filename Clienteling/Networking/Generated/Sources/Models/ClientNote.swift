/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientNote: Codable, Equatable {

    let advisorName: String
    let content: String
    let datetime: ISO8601DateTime
    let deleteable: Bool
    let editable: Bool
    let id: String
    let storeName: String

    enum CodingKeys: String, CodingKey {
        case advisorName = "advisorName"
        case content = "content"
        case datetime = "datetime"
        case deleteable = "deleteable"
        case editable = "editable"
        case id = "id"
        case storeName = "storeName"
    }

    init(advisorName: String, content: String, datetime: ISO8601DateTime, deleteable: Bool, editable: Bool, id: String, storeName: String) {
        self.advisorName = advisorName
        self.content = content
        self.datetime = datetime
        self.deleteable = deleteable
        self.editable = editable
        self.id = id
        self.storeName = storeName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.advisorName = try container.mkDecode(String.self, forKey: .advisorName)
        self.content = try container.mkDecode(String.self, forKey: .content)
        self.datetime = try container.mkDecode(ISO8601DateTime.self, forKey: .datetime)
        self.deleteable = try container.mkDecode(Bool.self, forKey: .deleteable)
        self.editable = try container.mkDecode(Bool.self, forKey: .editable)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.storeName = try container.mkDecode(String.self, forKey: .storeName)
    }
}
