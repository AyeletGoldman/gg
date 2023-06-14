// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The route descriptor for confirm creating a new appointment scene
public struct ConfirmDeleteAppointmentRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ConfirmDeleteAppointmentRouteDescriptor"

    /// The data for the appointment to be deleted
    public let appointment: BookAppointmentDisplayable

    /// The closure to invoke when the appointment has been successfully cancelled
    public let didCancel: (UIViewController) -> Void

    /// Creates a new `ConfirmDeleteAppointmentRouteDescriptor`
    /// - Parameters:
    ///   - appointment: The data for the appointment to be deleted
    ///   - didCancel: The closure to invoke when the appointment has been successfully cancelled
    public init(appointment: BookAppointmentDisplayable, didCancel: @escaping (UIViewController) -> Void) {
        self.appointment = appointment
        self.didCancel = didCancel
    }
}
