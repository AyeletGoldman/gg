// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import UIKit

/// The route descriptor for the EditAppointment screen
public struct EditAppointmentRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "EditAppointmentRouteDescriptor"

    /// The identifier of the appointment to edit
    public let appointmentId: String
    /// The closure to perform after cancelling the appointment
    public let didCancel: (UIViewController) -> Void

    /// Creates a new `EditAppointmentRouteDescriptor`
    /// - Parameters:
    ///   - appointmentId: The identifier of the appointment to edit
    ///   - didCancel: The closure to perform after cancelling the appointment
    public init(appointmentId: String, didCancel: @escaping (UIViewController) -> Void) {
        self.appointmentId = appointmentId
        self.didCancel = didCancel
    }
}
