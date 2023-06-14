/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TypedValueText: Codable, Equatable {

    enum TypedValueTextType: String, Codable, Equatable, CaseIterable {
        case text = "text"
    }

    let apiName: String
    let copyable: Bool?
    let translationKey: String?
    let type: TypedValueTextType
    let value: String?

    enum CodingKeys: String, CodingKey {
        case apiName = "apiName"
        case copyable = "copyable"
        case translationKey = "translationKey"
        case type = "type"
        case value = "value"
    }

    init(apiName: String, copyable: Bool? = nil, translationKey: String? = nil, type: TypedValueTextType, value: String? = nil) {
        self.apiName = apiName
        self.copyable = copyable
        self.translationKey = translationKey
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiName = try container.mkDecode(String.self, forKey: .apiName)
        self.copyable = try container.mkDecodeIfPresent(Bool.self, forKey: .copyable)
        self.translationKey = try container.mkDecodeIfPresent(String.self, forKey: .translationKey)
        self.type = try container.mkDecode(TypedValueTextType.self, forKey: .type)
        self.value = try container.mkDecodeIfPresent(String.self, forKey: .value)
    }
}
