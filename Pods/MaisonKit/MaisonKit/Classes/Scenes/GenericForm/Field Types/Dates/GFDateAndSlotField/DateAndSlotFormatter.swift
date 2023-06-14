// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A formatter for a `DateAndSlot` object.
public final class DateAndSlotFormatter: Formatter {

    private enum Labels {
        // swiftlint:disable line_length
        static let format = MKLocalizedString("formatters.date-and-slot.format",
                                              comment: "The format to use when creating a date and slot string. The first placeholder is the date and the second placeholder is the time interval.")
        // swiftlint:enable line_length
    }

    /// Creates a new `DateAndSlotFormatter`
    override public init() {
        super.init()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    /// Creates a new `String` from a `DateAndSlot` object.
    /// - Parameter obj: the object to create the string for. If this is not a `DateAndSlot`, this function returns `nil`.
    /// - Returns: A localized string representing a `DateAndSlot`.
    public override func string(for obj: Any?) -> String? {
        guard let dateAndSlot = obj as? DateAndSlot else { return nil }

        let dateInterval = DateInterval(start: dateAndSlot.slot.startTime, end: dateAndSlot.slot.endTime)

        guard let timeInterval = DateFormatter.shortTimeRangeFormatter.string(from: dateInterval) else { return nil }

        return String(format: Labels.format,
                      DateFormatter.medium.string(from: dateAndSlot.date),
                      timeInterval)
    }

    // Not implemented, you can't turn a `String` into a `DateAndSlot`.
    public override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
                                        for string: String,
                                        errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        return false
    }
}
