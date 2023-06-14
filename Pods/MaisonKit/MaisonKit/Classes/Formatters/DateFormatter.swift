// Copyright © 2020 LVMH. All rights reserved.

import Foundation

extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options, timeZone: TimeZone = TimeZone.autoupdatingCurrent) {
        self.init()
        self.formatOptions = formatOptions
        self.timeZone = timeZone
    }
}

extension Formatter {

    /// A date formatter to format dates in ISO8601 with fractional seconds
    public static let iso8601withFractionalSeconds = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
}

extension Date {

    /// Creates a `String` from this `Date` in ISO8601 with fractional seconds format
    public var iso8601withFractionalSeconds: String { return Formatter.iso8601withFractionalSeconds.string(from: self) }
}

extension String {

    /// Attempts to parse the `String` into a `Date` using ISO8601 with fractional seconds
    public var iso8601withFractionalSeconds: Date? { return Formatter.iso8601withFractionalSeconds.date(from: self) }
}

public extension DateFormatter {

    /// A default date formatter.
    /// Formats dates like "December 31, 1999"
    static let `default`: DateFormatter = {
        return DateFormatter.buildDateFormatter(style: .long)
    }()

    /// A medium date formatter.
    /// Formats dates typically with abbreviated text, such as “Nov 23, 1937” or “3:30:32 PM”.
    static let medium: DateFormatter = {
        return DateFormatter.buildDateFormatter(style: .medium)
    }()

    /// A short date formatter
    /// Formats dates  typically numeric only, such as “11/23/37” or “3:30 PM”.
    static let short: DateFormatter = {
        return DateFormatter.buildDateFormatter(style: .short)
    }()

    /// A UTC default date formatter.
    /// Formats dates like "December 31, 1999"
    static let defaultUTC: DateFormatter = {
        return DateFormatter.buildUTCDateFormatter(style: .long)
    }()

    /// A UTC medium date formatter.
    /// Formats dates typically with abbreviated text, such as “Nov 23, 1937” or “3:30:32 PM”.
    static let mediumUTC: DateFormatter = {
        return DateFormatter.buildUTCDateFormatter(style: .medium)
    }()

    /// A UTC short date formatter
    /// Formats dates  typically numeric only, such as “11/23/37” or “3:30 PM”.
    static let shortUTC: DateFormatter = {
        return DateFormatter.buildUTCDateFormatter(style: .short)
    }()

    /// A time-only date formatter
    /// Formats dates typically numeric only with just the time: "5.00" or "14:00".
    static let timeOnlyFormatter: DateFormatter = {
        let formatter = DateFormatter.buildDateFormatter(style: .none)
        formatter.timeStyle = .short
        return formatter
    }()

    /// A formatter for time ranges
    /// Formats dates typically numeric only with just the time: "5.00 - 6.00".
    static let shortTimeRangeFormatter: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.locale = Locale.autoupdatingCurrent
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()

    private static func buildDateFormatter(style: DateFormatter.Style) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }

    private static func buildUTCDateFormatter(style: DateFormatter.Style) -> DateFormatter {
        let formatter = DateFormatter.buildDateFormatter(style: style)
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }
}
