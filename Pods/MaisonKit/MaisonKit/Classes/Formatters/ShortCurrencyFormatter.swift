// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import nmbr_icu

public extension NumberFormatter {

    private static var currencyFormatters: [CurrencyFormatterKey: NumberFormatter] = [:]

    /// Creates, if necessary, a formatter for currencies that returns strings of shortened large numbers
    /// For example 1_000_000 euros will be converted to `€1M` (or the appropriate localised equivalent).
    /// You can call this method several times with the same parameters and you will not create new formatters each time, they will be cached and returned immediately.
    /// - Parameters:
    ///   - locale: the locale for the formatter. Defaults to `.autoupdatingCurrent`.
    ///   - currencyCode: the currency code for the currency that will be formatted
    /// - Returns: a `NumberFormatter` instance with no fraction digits and rounding mode `.floor` or `nil` if the currency code was invalid.
    static func shortCurrencyFormatter(locale: Locale = .autoupdatingCurrent,
                                       currencyCode: String) -> NumberFormatter {
        let key = CurrencyFormatterKey(currencyCode: currencyCode, localeIdentifier: locale.identifier)
        if let formatter = Self.currencyFormatters[key] {
            return formatter
        }
        let formatter = ShortCurrencyNumberFormatter(currencyCode: currencyCode, locale: locale)
        Self.currencyFormatters[key] = formatter
        return formatter
    }
}

private class ShortCurrencyNumberFormatter: NumberFormatter {
    private let formatter: NMBRFormatter

    init(currencyCode: String, locale: Locale) {
        self.formatter =  NMBRFormatter(locale: locale,
                                        currencyCode: currencyCode)
        super.init()
    }

    required init?(coder: NSCoder) {
        self.formatter = NMBRFormatter()
        super.init(coder: coder)
    }

    override func string(from number: NSNumber) -> String? {
        return self.formatter.string(from: number.doubleValue)
    }

    override func string(for obj: Any?) -> String? {
        guard let obj = obj else { return nil }

        guard let number = obj as? NSNumber else { return nil }

        return self.string(from: number)
    }
}
