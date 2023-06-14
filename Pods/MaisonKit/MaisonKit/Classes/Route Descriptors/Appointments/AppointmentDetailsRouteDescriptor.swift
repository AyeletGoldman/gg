// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the appointment details scene
public struct AppointmentDetailsRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "AppointmentDetailsRouteDescriptor"

    /// The appointment ID to retrieve the data for
    public let appointmentId: String
    /// Whether the navigation to Client360 should be allowed
    public let shouldAllowClient360Navigation: Bool

    /// Creates a new `AppointmentDetailsRouteDescriptor`
    /// - Parameters:
    ///   - appointmentId: The appointment ID to retrieve the data for
    ///   - shouldAllowClient360Navigation: Specify whether the navigation to Client360 should be allowed
    public init(appointmentId: String, shouldAllowClient360Navigation: Bool = true) {
        self.appointmentId = appointmentId
        self.shouldAllowClient360Navigation = shouldAllowClient360Navigation
    }
}
