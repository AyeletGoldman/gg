/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TypedValuePicklist: Codable, Equatable {

    enum TypedValuePicklistType: String, Codable, Equatable, CaseIterable {
        case picklist = "picklist"
    }

    let apiName: String
    let copyable: Bool?
    let picklistOptions: [PicklistOptionsItem]?
    let translationKey: String?
    let type: TypedValuePicklistType
    let value: String?

    enum CodingKeys: String, CodingKey {
        case apiName = "apiName"
        case copyable = "copyable"
        case picklistOptions = "picklistOptions"
        case translationKey = "translationKey"
        case type = "type"
        case value = "value"
    }

    init(apiName: String, copyable: Bool? = nil, picklistOptions: [PicklistOptionsItem]? = nil, translationKey: String? = nil, type: TypedValuePicklistType, value: String? = nil) {
        self.apiName = apiName
        self.copyable = copyable
        self.picklistOptions = picklistOptions
        self.translationKey = translationKey
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiName = try container.mkDecode(String.self, forKey: .apiName)
        self.copyable = try container.mkDecodeIfPresent(Bool.self, forKey: .copyable)
        self.picklistOptions = try container.mkDecodeIfPresent([PicklistOptionsItem].self, forKey: .picklistOptions)
        self.translationKey = try container.mkDecodeIfPresent(String.self, forKey: .translationKey)
        self.type = try container.mkDecode(TypedValuePicklistType.self, forKey: .type)
        self.value = try container.mkDecodeIfPresent(String.self, forKey: .value)
    }
}
