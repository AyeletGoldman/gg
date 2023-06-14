// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct ConfirmAppointmentScene: Scene {

    let appointment: BookAppointmentDisplayable
    let actionType: ConfirmAppointmentActionType
    let onDone: (UIViewController) -> Void

    init(appointment: BookAppointmentDisplayable,
         actionType: ConfirmAppointmentActionType,
         onDone: @escaping (UIViewController) -> Void) {
        self.appointment = appointment
        self.actionType = actionType
        self.onDone = onDone
    }

    func createViewController() -> ConfirmAppointmentViewController {
        return ConfirmAppointmentViewController()
    }

    func configure(controller: ConfirmAppointmentViewController, using factory: SceneFactory) {
        let viewModel = ConfirmAppointmentViewModel(
            appointment: self.appointment,
            actionType: self.actionType,
            onDone: { [weak controller] in
                guard let controller = controller else { return }
                self.onDone(controller)
            })
        controller.viewModel = viewModel
    }
}
