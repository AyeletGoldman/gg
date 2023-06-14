/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct JSendError: Codable, Equatable {

    let code: Double
    let data: JSON
    let message: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case data = "data"
        case message = "message"
        case status = "status"
    }

    init(code: Double, data: JSON, message: String, status: String) {
        self.code = code
        self.data = data
        self.message = message
        self.status = status
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.mkDecode(Double.self, forKey: .code)
        self.data = try container.mkDecode(JSON.self, forKey: .data)
        self.message = try container.mkDecode(String.self, forKey: .message)
        self.status = try container.mkDecode(String.self, forKey: .status)
    }
}
