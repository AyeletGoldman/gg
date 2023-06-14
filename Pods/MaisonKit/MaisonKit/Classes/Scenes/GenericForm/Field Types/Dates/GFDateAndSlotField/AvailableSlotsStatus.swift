// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// Failed loading date and slots data options status with retry action to try loading the items again
public struct AvailableSlotsStatusError: Error {

    enum Labels {
        static let defaultErrorDescription = MKLocalizedString("generic-form.field.date-and-slots.options.error.title",
                                                               comment: "Title error title for date and slots field options")
    }

    /// The retry action in case of failed status
    public let action: () -> Void
    /// The localized error to show in the date and slots field instead of the value in case of an error
    public let errorDescription: String

    /// Creates a new `AvailableSlotsStatusError`
    /// - Parameters:
    ///   - action: The retry action in case of failed status
    ///   - errorDescription: The localized error to show in the date and slots field instead of the value in case of an error. Defaults to `nil`.
    ///     If no value is passed, the error displayed is a generic error message defined by the translation value for `generic-form.field.date-and-slots.options.error.title`.
    public init(action: @escaping () -> Void, errorDescription: String? = nil) {
        self.action = action
        self.errorDescription = errorDescription ?? Labels.defaultErrorDescription
    }
}

/// The available slots data options in date and slots field in generic form
public struct AvailableSlotsData {
    /// A closure to define the available slots by the selected date
    public let availableSlotsClosure: (Date) -> [CalendarSlot]
    /// An optional closure to define the dates to disable
    public let shouldDisableDate: ((Date) -> Bool)?

    /// Creates a new `AvailableSlotsData`
    /// - Parameters:
    ///   - availableSlotsClosure: A closure to define the available slots by the selected date
    ///   - shouldDisableDate: An optional closure to define the dates to disable. Defaults to `nil`.
    public init(availableSlotsClosure: @escaping (Date) -> [CalendarSlot],
                shouldDisableDate: ((Date) -> Bool)? = nil) {
        self.availableSlotsClosure = availableSlotsClosure
        self.shouldDisableDate = shouldDisableDate
    }
}

/// The date and slots data options status in generic form fields
/// `.waiting`: slots data is not initialised yet. the field is disabled and grayed out.
/// `.loading`: slots data is loading. the field is disabled with an enabled design + an animated spinner in the trailing corner.
/// `.found`: slots data is available. the field is enabled and a calendar with the slots will be shown when tapping.
/// `.error`: failed to load slots data. the field has an error design + error message instead of the value + retry button.
public typealias AvailableSlotsStatus = ResultState<AvailableSlotsData, AvailableSlotsStatusError>

public extension AvailableSlotsStatus {

    /// The retry action in case of failed status
    var retryAction: (() -> Void)? {
        if case .failed(let error) = self {
            return error.action
        } else {
            return nil
        }
    }

    /// The error description in case of failed status
    var errorDescription: String? {
        if case .failed(let error) = self {
            return error.errorDescription
        } else {
            return nil
        }
    }

}
