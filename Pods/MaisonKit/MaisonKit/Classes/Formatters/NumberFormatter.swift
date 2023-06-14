// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import nmbr_icu

public extension NumberFormatter {

    /// A default number formatter.
    /// Formats numbers like "10,000.3"
    /// Use `CurrencyFormatter`, `WholeUnitCurrencyFormatter` or `ShortCurrencyFormatter` to format prices and values with currencies
    static let `default`: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.autoupdatingCurrent
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    /// A short number formatter
    /// Shortens numbers, such as 1100 ->  “1.1K” or 10_000_000 -> “10M”. Use this formatter to format _numbers_ not currencies.
    /// Use `ShortCurrencyFormatter` to format prices and values with currencies
    static let short: NumberFormatter = {
        let shortFormatter = ShortNumberFormatter(locale: Locale.autoupdatingCurrent,
                                                  precision: 2)
        return shortFormatter
    }()
}

private class ShortNumberFormatter: NumberFormatter {

    private let formatter: NMBRFormatter

    init(locale: Locale, precision: UInt8) {
        self.formatter = NMBRFormatter(locale: locale,
                                       maxPrecision: precision)
        super.init()
    }

    required init?(coder: NSCoder) {
        self.formatter = NMBRFormatter(locale: Locale.current,
                                       maxPrecision: 2)
        super.init(coder: coder)
    }

    override func string(from number: NSNumber) -> String? {
        return self.formatter.string(from: number.doubleValue)
    }
}
