// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension DateFormatter {
    /// A date formatter for printing date in the past. in use in notification center.
    /// 1. If the date is in the future or before more than 6 days, return full date and time formatter
    /// 2. If the date is in the past 6 days but not today, return "Yesterday" or "Mon"/"Tue".. + the time
    /// 3. If the date is today and past more than one hours, return only the time
    /// 4. the date is in the past hour and past more than one minutes, return "34m ago"
    /// 5. If the date is in current minute, return "Now"
    static let pastDateFormatter: DateFormatter = {
        return PastDateFormatter()
    }()
}

private final class PastDateFormatter: DateFormatter {

    private enum Labels {
        static let now = MKLocalizedString("formatters.past-date.now.format",
                                           comment: "The format to use for past date format when the date is in the past 59 seconds")
        static let pastMinutes = MKLocalizedString("formatters.past-date.past-minutes.format",
                                                   comment: "The format to use for past date format when the date is in the past 59 minutes. The placeholder is the minutes count.")
        // swiftlint:disable line_length
        static let fullDateAndTime = MKLocalizedString("formatters.past-date.full-date-time.format",
                                                       comment: "The full date format to use for past date format. The first placeholder is the date and the second placeholder is the time.")
        // swiftlint:enable line_length
    }

    override func string(from date: Date) -> String {
        let dateComponents = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: date, to: Date())
        // 1. if the date is in the future or before more than 6 days, return full date and time formatter
        if date > Date() || dateComponents.day ?? 0 > 6 {
            return String(format: Labels.fullDateAndTime,
                          DateFormatter.medium.string(from: date),
                          DateFormatter.timeOnlyFormatter.string(from: date))
        }
        // 2. if the date is in the past 6 days but not today, return "Yesterday" or "Mon"/"Tue".. + the time
        else if dateComponents.day ?? 0 > 0 || !date.isToday() {
            return String(format: Labels.fullDateAndTime,
                          date.toRelatedPastDay(),
                          DateFormatter.timeOnlyFormatter.string(from: date))
        }
        // 3. if the date is today and past more than one hours, return only the time
        else if dateComponents.hour ?? 0 > 0 {
            return DateFormatter.timeOnlyFormatter.string(from: date)
        }
        // 4. if the date is in the past hour and past more than one minutes, return "34m ago"
        else if dateComponents.minute ?? 0 > 0 {
            return String(format: Labels.pastMinutes, dateComponents.minute ?? 0)
        }
        // 5. if the date is in current minute, return "Now"
        else {
            return Labels.now
        }
    }
}

private extension Date {

    func isToday() -> Bool {
        Calendar.current.startOfDay(for: self) == Calendar.current.startOfDay(for: Date())
    }

    func toRelatedPastDay() -> String {
        let string = DateFormatter.relativeFormatter.string(from: self) // Only for getting yesterday
        if string.rangeOfCharacter(from: .decimalDigits) == nil {
            return DateFormatter.dayFormatter.string(from: self)
        } else {
            return string
        }
    }
}

private extension DateFormatter {

    static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    static let relativeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        formatter.locale = Locale.autoupdatingCurrent
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()
}
