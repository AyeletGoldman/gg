// Copyright © 2022 LVMH. All rights reserved.

import Foundation

final class BookAppointmentRouter: Router<BookAppointmentViewController>, DefaultGenericFormPresenterRouter {

    func presentAppointmentConfirmationScene(appointment: BookAppointmentDisplayable, onDone: @escaping (Bool) -> Void) {
        let scene = self.factory.retrieveScene(with: ConfirmBookAppointmentRouteDescriptor(appointment: appointment, onDone: { _ in
            onDone(true)
        }))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

}
