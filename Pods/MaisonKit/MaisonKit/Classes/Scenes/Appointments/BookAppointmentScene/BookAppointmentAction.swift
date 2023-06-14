// Copyright © 2021 LVMH. All rights reserved.

import Combine

public extension MenuAction {

    /// Creates a new `MenuAction` that will be used to display the Client 360 book appointment scene
    /// - Parameters:
    ///   - clientId: The client ID the appointment should booked for
    /// - Returns: an instance of `MenuAction` that will return the book appointment scene.
    static func bookAppointmentAction(clientId: String) -> MenuAction {
        let title = MKLocalizedString("client360.actions.book-appointment.title",
                                      comment: "The title of the client 360 action for booking an appointment")
        let action = MenuAction(localizedTitle: title,
                                imageIdentifier: Self.buildIdentifier(withToken: "icon-calendar"),
                                preferredPresentationStyle: .modal,
                                routeDescriptorFactory: { onClose in
            return BookAppointmentRouteDescriptor(clientId: clientId, onDone: { didSave, viewController in
                onClose?(viewController)
                if didSave {
                    ToastView.show(text: MKLocalizedString("appointments.appointment-booked.toast.title",
                                                           comment: "The text to show on a toast when an appointment has been successfully booked"),
                                   style: .success)
                    if !Features.manager.isEnabled(.enableTimelinePublisherRefreshFromImplementation, defaultValue: true) {
                        NotificationCenter.default.post(name: .outreachCompletedSuccessfullyNotification, object: clientId)
                    }
                }
            })
        })

        return action
    }
}
