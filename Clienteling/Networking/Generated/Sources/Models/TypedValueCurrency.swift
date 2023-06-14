/// THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT IT.
/// IF YOU EDIT THIS FILE, THE MOST LIKELY SCENARIO IS THAT
/// YOUR CHANGES WILL BE OVERRIDDEN NEXT TIME THE FILE IS GENERATED.
///
/// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct TypedValueCurrency: Codable, Equatable {

    enum TypedValueCurrencyType: String, Codable, Equatable, CaseIterable {
        case currency = "currency"
    }

    let apiName: String
    let copyable: Bool?
    let currencyCode: String?
    let currencyDivisor: Double?
    let translationKey: String?
    let type: TypedValueCurrencyType
    let value: Int?

    enum CodingKeys: String, CodingKey {
        case apiName = "apiName"
        case copyable = "copyable"
        case currencyCode = "currencyCode"
        case currencyDivisor = "currencyDivisor"
        case translationKey = "translationKey"
        case type = "type"
        case value = "value"
    }

    init(apiName: String, copyable: Bool? = nil, currencyCode: String? = nil, currencyDivisor: Double? = nil, translationKey: String? = nil, type: TypedValueCurrencyType, value: Int? = nil) {
        self.apiName = apiName
        self.copyable = copyable
        self.currencyCode = currencyCode
        self.currencyDivisor = currencyDivisor
        self.translationKey = translationKey
        self.type = type
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiName = try container.mkDecode(String.self, forKey: .apiName)
        self.copyable = try container.mkDecodeIfPresent(Bool.self, forKey: .copyable)
        self.currencyCode = try container.mkDecodeIfPresent(String.self, forKey: .currencyCode)
        self.currencyDivisor = try container.mkDecodeIfPresent(Double.self, forKey: .currencyDivisor)
        self.translationKey = try container.mkDecodeIfPresent(String.self, forKey: .translationKey)
        self.type = try container.mkDecode(TypedValueCurrencyType.self, forKey: .type)
        self.value = try container.mkDecodeIfPresent(Int.self, forKey: .value)
    }
}
