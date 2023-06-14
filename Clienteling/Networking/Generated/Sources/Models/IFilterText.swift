/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct IFilterText: Codable, Equatable {

    enum IFilterTextType: String, Codable, Equatable, CaseIterable {
        case text = "text"
        case images = "images"
    }

    let apiName: String
    let isMultiSelect: Bool
    let isRequired: Bool
    let items: [IFilterItemDefault]
    let key: String
    let pluralTranslationKey: String?
    let translationKey: String
    let type: IFilterTextType

    enum CodingKeys: String, CodingKey {
        case apiName = "apiName"
        case isMultiSelect = "isMultiSelect"
        case isRequired = "isRequired"
        case items = "items"
        case key = "key"
        case pluralTranslationKey = "pluralTranslationKey"
        case translationKey = "translationKey"
        case type = "type"
    }

    init(apiName: String, isMultiSelect: Bool, isRequired: Bool, items: [IFilterItemDefault], key: String, pluralTranslationKey: String? = nil, translationKey: String, type: IFilterTextType) {
        self.apiName = apiName
        self.isMultiSelect = isMultiSelect
        self.isRequired = isRequired
        self.items = items
        self.key = key
        self.pluralTranslationKey = pluralTranslationKey
        self.translationKey = translationKey
        self.type = type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiName = try container.mkDecode(String.self, forKey: .apiName)
        self.isMultiSelect = try container.mkDecode(Bool.self, forKey: .isMultiSelect)
        self.isRequired = try container.mkDecode(Bool.self, forKey: .isRequired)
        self.items = try container.mkDecode([IFilterItemDefault].self, forKey: .items)
        self.key = try container.mkDecode(String.self, forKey: .key)
        self.pluralTranslationKey = try container.mkDecodeIfPresent(String.self, forKey: .pluralTranslationKey)
        self.translationKey = try container.mkDecode(String.self, forKey: .translationKey)
        self.type = try container.mkDecode(IFilterTextType.self, forKey: .type)
    }
}
