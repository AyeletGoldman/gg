/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct PluginErrorResponse: Codable, Equatable {

    let data: JSON
    let err: String

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case err = "err"
    }

    init(data: JSON, err: String) {
        self.data = data
        self.err = err
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.mkDecode(JSON.self, forKey: .data)
        self.err = try container.mkDecode(String.self, forKey: .err)
    }
}
