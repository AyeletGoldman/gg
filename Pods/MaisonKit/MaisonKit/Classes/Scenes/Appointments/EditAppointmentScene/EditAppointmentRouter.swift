// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A router for the edit appointment scene
public protocol EditAppointmentRouter: GenericFormRouter {

    /// Presents the cancel appointment scene
    /// - Parameters:
    ///   - appointment: The appointment details to display in the cancellation screen
    ///   - didCancel: A closure to invoke when the appointment has been cancelled
    func presentCancelAppointmentConfirmation(appointment: BookAppointmentDisplayable, didCancel: @escaping () -> Void)
}

final class DefaultEditAppointmentRouter: Router<EditAppointmentViewController>, EditAppointmentRouter, DefaultGenericFormPresenterRouter {
    func presentCancelAppointmentConfirmation(appointment: BookAppointmentDisplayable, didCancel: @escaping () -> Void) {
        let descriptor = ConfirmDeleteAppointmentRouteDescriptor(appointment: appointment, didCancel: { controller in
            controller.navigationController?.popViewController(animated: true)
            didCancel()
        })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
}
