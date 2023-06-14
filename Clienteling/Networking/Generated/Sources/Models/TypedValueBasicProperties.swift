/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TypedValueBasicProperties: Codable, Equatable {

    let apiName: String
    let copyable: Bool?
    let translationKey: String?

    enum CodingKeys: String, CodingKey {
        case apiName = "apiName"
        case copyable = "copyable"
        case translationKey = "translationKey"
    }

    init(apiName: String, copyable: Bool? = nil, translationKey: String? = nil) {
        self.apiName = apiName
        self.copyable = copyable
        self.translationKey = translationKey
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiName = try container.mkDecode(String.self, forKey: .apiName)
        self.copyable = try container.mkDecodeIfPresent(Bool.self, forKey: .copyable)
        self.translationKey = try container.mkDecodeIfPresent(String.self, forKey: .translationKey)
    }
}
