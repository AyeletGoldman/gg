/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct RegistrationTokenResponse: Codable, Equatable {

    let token: String?

    enum CodingKeys: String, CodingKey {
        case token = "token"
    }

    init(token: String? = nil) {
        self.token = token
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.token = try container.mkDecodeIfPresent(String.self, forKey: .token)
    }
}
