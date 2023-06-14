// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct EditAppointmentScene: Scene {

    private let appointmentId: String
    private let didCancel: (UIViewController) -> Void

    init(appointmentId: String, didCancel: @escaping (UIViewController) -> Void) {
        self.appointmentId = appointmentId
        self.didCancel = didCancel
    }

    func createViewController() -> EditAppointmentViewController {
        return EditAppointmentViewController()
    }

    func configure(controller: EditAppointmentViewController, using factory: SceneFactory) {
        let router = DefaultEditAppointmentRouter(controller: controller, factory: factory)
        let viewModel = EditAppointmentViewModel(
            appointmentId: self.appointmentId,
            didCancel: { [weak controller] in
                guard let controller = controller else { return }
                self.didCancel(controller)
            },
            router: router)
        controller.viewModel = viewModel
    }
}
