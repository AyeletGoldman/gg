/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct UserInfoStore: Codable, Equatable {

    let code: String
    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case id = "id"
        case name = "name"
    }

    init(code: String, id: String, name: String) {
        self.code = code
        self.id = id
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.mkDecode(String.self, forKey: .code)
        self.id = try container.mkDecode(String.self, forKey: .id)
        self.name = try container.mkDecode(String.self, forKey: .name)
    }
}
