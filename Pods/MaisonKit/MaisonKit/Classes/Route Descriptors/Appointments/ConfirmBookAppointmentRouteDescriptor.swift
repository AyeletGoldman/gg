// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for confirm creating a new appointment scene
public struct ConfirmBookAppointmentRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ConfirmBookAppointmentRouteDescriptor"

    /// The data for the appointment to be created
    public let appointment: BookAppointmentDisplayable

    /// The closure to invoke when the appointment has been successfully created
    public let onDone: (UIViewController) -> Void

    /// Creates a new `ConfirmBookAppointmentRouteDescriptor`
    /// - Parameters:
    ///   - appointment: The data for the appointment to be created
    ///   - onDone: The closure to invoke when the appointment has been successfully created
    public init(appointment: BookAppointmentDisplayable, onDone: @escaping (UIViewController) -> Void) {
        self.appointment = appointment
        self.onDone = onDone
    }
}
