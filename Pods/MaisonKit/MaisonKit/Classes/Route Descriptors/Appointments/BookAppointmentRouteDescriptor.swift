// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for booking a new appointment
public struct BookAppointmentRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "BookAppointmentRouteDescriptor"

    /// Optional. The client ID the appointment should be booked for.
    public let clientId: String?
    /// The done closure to decide what to do when saving or canceling the form
    public let onDone: (_ didSave: Bool, UIViewController) -> Void

    /// Creates a new `BookAppointmentRouteDescriptor`
    /// - Parameters:
    ///   - clientId: Optional. The client ID the appointment should be booked for. Defaults to `nil`.
    ///   - onDone: The closure to decide what to do when finished saving or canceling the form.
    public init(clientId: String? = nil,
                onDone: @escaping (_ didSave: Bool, UIViewController) -> Void) {
        self.clientId = clientId
        self.onDone = onDone
    }
}
