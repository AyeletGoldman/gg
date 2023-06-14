// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A time interval representation with a start time and an optional end time
public struct TimeRange {
    /// The date at which this time range should start
    public let startTime: Date
    /// The date at which this time range should end
    public let endTime: Date?

    /// Creates a new `TimeRange` with the given start and end times
    /// - Parameters:
    ///   - startTime: The date at which this time range should start
    ///   - endTime: The date at which this time range should end
    public init(startTime: Date, endTime: Date? = nil) {
        self.startTime = startTime
        self.endTime = endTime
    }

    /// Creates a new `TimeRange` with the given start time and duration
    /// - Parameters:
    ///   - startTime: The date at which this time range should start
    ///   - duration: The duration of the time range
    public init(startTime: Date, duration: TimeInterval) {
        self.startTime = startTime
        self.endTime = startTime.advanced(by: duration)
    }
}
