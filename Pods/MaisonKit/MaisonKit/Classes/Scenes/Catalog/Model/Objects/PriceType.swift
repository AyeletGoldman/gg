// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A price object that will hold either a single value or a price range.
public enum PriceType {
    /// A single price
    case price(TypedValue)
    /// A price range, between (left, right)
    case priceRange(TypedValue, TypedValue)

    /// Formats the price type as a `String`
    /// - Returns: A `String` with the price fully formatted
    public func toString() -> String {
        switch self {
        case .price(let value):
            return value.toString()
        case .priceRange(let minValue, let maxValue):
            return String.range(from: minValue.toString(), to: maxValue.toString())
        }
    }
}

public extension String {

    /// Convenience method to create a string for a price from a currency and an optional number formatter
    /// - Parameters:
    ///   - price: the price to convert to a fully-formatted string
    ///   - formatter: an optional formatter to use when formatting the price
    /// - Returns: a `String` instance which will be a fully-formatted price
    static func price(_ price: CurrencyConvertable, formatter: NumberFormatter? = nil) -> String {
        return price.toString(with: formatter)
    }

    /// Convenience method to create a string for a price range
    /// - Parameters:
    ///   - low: the lower bound of the price range
    ///   - high: the higher bound of the price range
    ///   - formatter: an optional formatter to use when formatting the price
    /// - Returns: a `String` instance which will be a fully-formatted price range
    static func priceRange(low: CurrencyConvertable, high: CurrencyConvertable, formatter: NumberFormatter? = nil) -> String {
        return String.range(from: low.toString(with: formatter), to: high.toString(with: formatter))
    }
}
