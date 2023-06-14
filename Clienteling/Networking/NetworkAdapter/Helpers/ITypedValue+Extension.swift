// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import MaisonKit
import StylableSwiftUI

extension TypedValue {

    var apiName: String {
        switch self {
        case .typedValueBoolean(let val):
            return val.apiName
        case .typedValueCurrency(let val):
            return val.apiName
        case .typedValueDatetime(let val):
            return val.apiName
        case .typedValueMultiPicklist(let val):
            return val.apiName
        case .typedValueMultiText(let val):
            return val.apiName
        case .typedValueNumber(let val):
            return val.apiName
        case .typedValuePicklist(let val):
            return val.apiName
        case .typedValueText(let val):
            return val.apiName
        case .typedValueDate(let val):
            return val.apiName
        }
    }

    var translationKey: String? {
        switch self {
        case .typedValueBoolean(let val):
            return val.translationKey
        case .typedValueCurrency(let val):
            return val.translationKey
        case .typedValueDatetime(let val):
            return val.translationKey
        case .typedValueMultiPicklist(let val):
            return val.translationKey
        case .typedValueMultiText(let val):
            return val.translationKey
        case .typedValueNumber(let val):
            return val.translationKey
        case .typedValuePicklist(let val):
            return val.translationKey
        case .typedValueText(let val):
            return val.translationKey
        case .typedValueDate(let val):
            return val.translationKey
        }
    }

    var isCopyable: Bool {
        let copyable: Bool? = {
            switch self {
            case .typedValueBoolean(let val):
                return val.copyable
            case .typedValueCurrency(let val):
                return val.copyable
            case .typedValueDatetime(let val):
                return val.copyable
            case .typedValueMultiPicklist(let val):
                return val.copyable
            case .typedValueMultiText(let val):
                return val.copyable
            case .typedValueNumber(let val):
                return val.copyable
            case .typedValuePicklist(let val):
                return val.copyable
            case .typedValueText(let val):
                return val.copyable
            case .typedValueDate(let val):
                return val.copyable
            }
        }()
        return copyable ?? false
    }
}
