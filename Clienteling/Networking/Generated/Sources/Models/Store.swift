/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct Store: Codable, Equatable {

    let code: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
    }

    init(code: String, name: String) {
        self.code = code
        self.name = name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.mkDecode(String.self, forKey: .code)
        self.name = try container.mkDecode(String.self, forKey: .name)
    }
}
