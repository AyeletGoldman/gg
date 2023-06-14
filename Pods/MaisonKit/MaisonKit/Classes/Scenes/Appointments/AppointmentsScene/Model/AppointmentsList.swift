// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A list of appointments. Usually used in an agenda format where we want to show a set of appointments as well as a calendar.
public struct AppointmentsList {
    /// The appointments, divided by date components. Each date will have a timeline section to be displayed.
    public let appointments: [DateComponents: TimelineDisplayable.Section]
    /// The set of available filters for this list.
    public let filters: [TimelineDisplayable.Filter]

    /// Creates a new `AppointmentsList`. This list contains the list of appointments organised by date and the
    /// list of filters that can be applied to this list.
    /// - Parameters:
    ///   - appointments: The appointments, divided by date components. Each date will have a timeline section to be displayed.
    ///   - filters: The set of available filters for this list.
    public init(appointments: [DateComponents: TimelineDisplayable.Section],
                filters: [TimelineDisplayable.Filter]) {
        self.appointments = appointments
        self.filters = filters
    }
}
