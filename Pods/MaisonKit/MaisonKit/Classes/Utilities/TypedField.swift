// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public struct TypedField: Codable, Identifiable {

    public let id: String
    let title: String
    public let value: TypedValue
    let isCopyable: Bool
    let icon: StylistIdentifier?

    public init(id: String = UUID().uuidString,
                title: String = "",
                value: TypedValue,
                isCopyable: Bool = false,
                icon: StylistIdentifier? = nil) {
        self.id = id
        self.title = title
        self.value = value
        self.isCopyable = isCopyable
        self.icon = icon
    }
}

/// A container for different types of values that can be represented as text for display
public enum TypedValue {

    /// A set of lines as `String`s. These are displayed as strings separated by new lines.
    case text(lines: [String])
    /// A date type. This is displayed with the given date formatter, or if `nil`, a default formatter.
    case datetime(Date, DateFormatter? = nil)
    /// A currency type. This is displayed with the given number formatter, or if `nil`, a default formatter.
    case currency(CurrencyConvertable, NumberFormatter? = nil)

    /// Transforms `self` into its textual representation.
    /// - Returns: a `String` value used for display.
    public func toString() -> String {
        switch self {
        case .text(let lines):
            return lines.joined(separator: "\n")
        case .datetime(let date, let formatter):
            return date.toString(with: formatter)
        case .currency(let currencyConvertable, let formatter):
            return currencyConvertable.toString(with: formatter)
        }
    }
}

extension Date {

    /// Returns a string from a given date using the default date formatter.
    /// - Parameter formatter: optional date formatter
    /// - Returns: a `String` representation of the date formatted according to the default date formatter.
    func toString(with formatter: DateFormatter? = nil) -> String {
        return (formatter ?? DateFormatter.default).string(from: self)
    }
}

extension TypedValue: Codable {

    enum CodingKeys: String, CodingKey {
        case value
        case type
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let type: String = try values.decode(String.self, forKey: .type)
        if type == "text" {
            let lines = try values.decode([String].self, forKey: .value)
            self = .text(lines: lines)
        } else if type == "datetime" {
            let value = try values.decode(Date.self, forKey: .value)
            self = .datetime(value)
        } else if type == "currency" {
            let currency = try values.decode(CurrencyConvertable.self, forKey: .value)
            self = .currency(currency)
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [CodingKeys.type],
                                                                    debugDescription: "Wrong value for type: \(type)"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .text(let lines):
            try container.encode(lines, forKey: .value)
            try container.encode("text", forKey: .type)
        case .datetime(let date, _):
            try container.encode(date, forKey: .value)
            try container.encode("datetime", forKey: .type)
        case .currency(let currency, _):
            try container.encode(currency, forKey: .value)
            try container.encode("currency", forKey: .type)
        }
    }
}

extension StylistIdentifier: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let val = try container.decode(String.self)
        self.init(stringLiteral: val)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.description)
    }
}

public extension TypedValue {

    /// Creates a `TypedValue` from a given `String` and `DateFormatter`.
    /// - Parameters:
    ///   - dateString: the string that represents the date. This will be formatted
    ///   - formatter: The formatter to use to create the date
    /// - Returns: If the date creation is successful, it returns a `.datetime` otherwise, it returns a `.text`
    static func getDateValue(dateString: String, formatter: DateFormatter) -> TypedValue {
        guard let dateValue = formatter.date(from: dateString) else {
                return .text(lines: [Localization.Strings.notAvailable])
        }
        return .datetime(dateValue, formatter)
    }
}
