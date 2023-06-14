// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension NumberFormatter {

    private static var currencyFormatters: [CurrencyFormatterKey: NumberFormatter] = [:]

    /// Creates, if necessary, a formatter for currencies as whole units. You can call this method several times with the same parameters and you will not
    /// create new formatters each time, they will be cached and returned immediately.
    /// - Parameters:
    ///   - locale: the locale for the formatter
    ///   - currencyCode: the currency code for the currency that will be formatted
    /// - Returns: a `NumberFormatter` instance with no fraction digits and rounding mode `.floor`
    static func wholeUnitCurrencyFormatter(locale: Locale, currencyCode: String) -> NumberFormatter {
        let key = CurrencyFormatterKey(currencyCode: currencyCode, localeIdentifier: locale.identifier)
        if let formatter = Self.currencyFormatters[key] {
            return formatter
        }
        let formatter = CurrencyFormatterFactory.formatter(for: currencyCode, locale: locale)
        formatter.maximumFractionDigits = 0
        formatter.roundingMode = .floor
        Self.currencyFormatters[key] = formatter
        return formatter
    }
}
