/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateClientList: Codable, Equatable {

    /// Can not exists when `memberIds` is populated.
    let criteria: JSON?
    let listType: ListType
    /// Can not exists when `criteria` is populated.
    let memberIds: [String]?
    let name: String

    enum CodingKeys: String, CodingKey {
        case criteria = "criteria"
        case listType = "listType"
        case memberIds = "memberIds"
        case name = "name"
    }

    init(criteria: JSON? = nil, listType: ListType, memberIds: [String]? = nil, name: String) {
        self.criteria = criteria
        self.listType = listType
        self.memberIds = memberIds
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.criteria = try container.mkDecodeIfPresent(JSON.self, forKey: .criteria)
        self.listType = try container.mkDecode(ListType.self, forKey: .listType)
        self.memberIds = try container.mkDecodeIfPresent([String].self, forKey: .memberIds)
        self.name = try container.mkDecode(String.self, forKey: .name)
    }
}
