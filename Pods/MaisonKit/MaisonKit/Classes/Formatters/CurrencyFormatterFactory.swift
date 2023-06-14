// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct CurrencyFormatterFactory {
    static func formatter(for currencyCode: String, locale: Locale) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.locale = locale
        return formatter
    }
}
