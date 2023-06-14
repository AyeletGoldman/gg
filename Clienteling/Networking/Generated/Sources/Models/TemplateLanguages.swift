/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TemplateLanguages: Codable, Equatable {

    let code: String
    let displayName: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case displayName = "displayName"
    }

    init(code: String, displayName: String) {
        self.code = code
        self.displayName = displayName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.mkDecode(String.self, forKey: .code)
        self.displayName = try container.mkDecode(String.self, forKey: .displayName)
    }
}
