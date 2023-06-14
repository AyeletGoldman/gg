// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// An object to hold currency number, or just a number, and convert it to the proper string by the given number formatter.
/// See https://lvmh-clienteling.github.io/maisonkit-docs/master/formatting-numbers-and-currencies.html
/// for more information on how to format currencies
public struct CurrencyConvertable: Codable {

    /// The currency code to print next to the number by the formatter.
    public let currencyCode: String?

    /// The number amount, in fractional unit of the monetary unit for the currency e.g. cents for euro, pennies for GBP...
    public let fractionalUnitAmount: Int

    /// The number of fractional unit for each monetary unit. e.g. 100 for euro, 1 for japanese yen...
    public let numberOfFractionalUnitsInMonetaryUnit: Int

    var dividedAmount: Double {
        if self.numberOfFractionalUnitsInMonetaryUnit > 0 {
            return Double(self.fractionalUnitAmount) / Double(self.numberOfFractionalUnitsInMonetaryUnit)
        }
        return Double(self.fractionalUnitAmount)
    }

    /// Created a new `CurrencyConvertible` object with integers for all properties.
    /// - Parameters:
    ///   - fractionalUnitAmount: the number amount, in smallest possible fractional unit for the currency e.g. cents for euro, pennies for GBP...
    ///   - numberOfFractionalUnitsInMonetaryUnit: the number of fractional unit for each monetary unit. e.g. 100 for euro, 1 for JPY...
    ///   - currencyCode: the currency code to print next to the number by the formatter.
    public init(fractionalUnitAmount: Int, numberOfFractionalUnitsInMonetaryUnit: Int, currencyCode: String) {
        self.fractionalUnitAmount = fractionalUnitAmount
        self.numberOfFractionalUnitsInMonetaryUnit = numberOfFractionalUnitsInMonetaryUnit
        self.currencyCode = currencyCode
    }

    /// Returns a string from a given `CurrencyConvertible` using the default currency formatter.
    /// If the passed in currency representation has a divisor the amount will be divided by that before converting.
    /// - Parameter formatter: optional number formatter
    /// - Returns: a `String` representation of the currency formatted according to the default currency formatter,
    /// or a placeholder string if we cannot create a `String`
    public func toString(with formatter: NumberFormatter? = nil) -> String {
        let preferredFormatter = self.getFormatterToUse(preferred: formatter)
        return preferredFormatter.string(from: self.dividedAmount as NSNumber) ?? Localization.Strings.notAvailable
    }

    private func getFormatterToUse(preferred: NumberFormatter?) -> NumberFormatter {
        // If we are given a preferred formatter, use that
        if let preferred = preferred {
            return preferred
        }
        // If we have a currency code, we should use a formatter that uses currency
        if let currencyCode = self.currencyCode {
            return NumberFormatter.currencyFormatter(locale: .autoupdatingCurrent, currencyCode: currencyCode)
        }
        // By default, we use a number formatter with no currencies
        return NumberFormatter.default
    }
}
