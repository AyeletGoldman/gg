// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// An object to represent birthday with an optional year. Can be use in generic form `birthday` field.
public struct Birthday: Equatable {
    /// The birthday day in month
    public var day: Int
    /// The birthday month
    public var month: Int
    /// Optional. The birthday day in year
    public var year: Int?

    /// Creates a new `Birthday`
    /// - Parameters:
    ///   - day: The birthday day in month
    ///   - month: The birthday month
    ///   - year: Optional. The birthday day in year
    public init(day: Int, month: Int, year: Int? = nil) {
        self.day = day
        self.month = month
        self.year = year
    }

    /// Creates a new `Birthday` by setting the day and month to the current day and month
    public init() {
        self.day = Calendar.gregorian.component(.day, from: Date())
        self.month = Calendar.gregorian.component(.month, from: Date())
    }

    /// Whether this daye is valid or not
    public var isValid: Bool {
        self.getDateComponent().isValidDate
    }

    func getEarliestClosestValidValue() -> Birthday {
        var validValue = self
        while !validValue.isValid {
            validValue = Birthday(day: validValue.day - 1, month: validValue.month, year: validValue.year)
        }
        return validValue
    }
}

private extension Birthday {
    func getDateComponent() -> DateComponents {
        // The leap year defines so we can retrieve format/validation for February 29th.
        // The value could be any leap year and should not be in use after getting the component.
        let leapYear = 2020
        return DateComponents(calendar: .gregorian, year: self.year ?? leapYear, month: self.month, day: self.day)
    }
}

private extension DateFormatter {
    static let monthAndDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .autoupdatingCurrent
        dateFormatter.setLocalizedDateFormatFromTemplate("d, MMMM")
        return dateFormatter
    }()
}
