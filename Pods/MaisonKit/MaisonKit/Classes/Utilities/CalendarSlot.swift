// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Each of the slots to be displayed for a date in the calendar; this ususally shows a time interval between `startTime` and `endTime`.
public struct CalendarSlot: Equatable, Identifiable {
    /// The identifier for this slot
    public let id: String
    /// The start slot date time
    public let startTime: Date
    /// The end slot date time
    public let endTime: Date

    /// Creates an instance of `CalendarSlot`
    /// - Parameters:
    ///   - id: An optional identifier for this slot. By default the identifier will be a combination of `startTime` and `endTime`
    ///   - startTime: The start slot date time
    ///   - endTime: The end slot date time
    public init(id: String? = nil, startTime: Date, endTime: Date) {
        self.id = id ?? Self.prepareID(startTime: startTime, endTime: endTime)
        self.startTime = startTime
        self.endTime = endTime
    }
}

private extension CalendarSlot {
    static func prepareID(startTime: Date, endTime: Date) -> String {
        return "\(startTime)_\(endTime)"
    }
}
