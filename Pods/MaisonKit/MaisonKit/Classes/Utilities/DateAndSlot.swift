// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A struct for getting and sending the selected date and slot in `CalendarAndSlotsViewModel`
public struct DateAndSlot: Equatable {
    /// The selected date
    public let date: Date
    /// The selected slot
    public let slot: CalendarSlot

    /// Creates an instance of `DateAndSlot`
    /// - Parameters:
    ///   - date: The selected date
    ///   - slot: The selected slot
    public init(date: Date, slot: CalendarSlot) {
        self.date = date
        self.slot = slot
    }
}
