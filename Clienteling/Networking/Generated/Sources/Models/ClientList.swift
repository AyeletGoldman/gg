/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct ClientList: Codable, Equatable {

    let header: ClientListHeader
    let id: String
    let members: [ClientListMember]

    enum CodingKeys: String, CodingKey {
        case header = "header"
        case id = "id"
        case members = "members"
    }

    init(header: ClientListHeader, id: String, members: [ClientListMember]) {
        self.header = header
        self.id = id
        self.members = members
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.header = try container.mkDecode(ClientListHeader.self, forKey: .header)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.members = try container.mkDecode([ClientListMember].self, forKey: .members)
    }
}
