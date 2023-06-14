/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct UserInfoContact: Codable, Equatable {

    let email: String?
    let information: String

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case information = "information"
    }

    init(email: String? = nil, information: String) {
        self.email = email
        self.information = information
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.mkDecodeIfPresent(String.self, forKey: .email)
        self.information = try container.mkDecode(String.self, forKey: .information)
    }
}
