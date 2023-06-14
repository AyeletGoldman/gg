// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct AppointmentDetailsScene: Scene {

    private let appointmentId: String
    private let shouldAllowClient360Navigation: Bool

    init(appointmentId: String, shouldAllowClient360Navigation: Bool) {
        self.appointmentId = appointmentId
        self.shouldAllowClient360Navigation = shouldAllowClient360Navigation
    }

    func createViewController() -> AppointmentDetailsViewController {
        return AppointmentDetailsViewController()
    }

    func configure(controller: AppointmentDetailsViewController, using factory: SceneFactory) {
        let router = DefaultAppointmentDetailsRouter(controller: controller, factory: factory)
        let viewModel = AppointmentDetailsViewModel(appointmentId: self.appointmentId, router: router, shouldAllowClient360Navigation: shouldAllowClient360Navigation)
        controller.viewModel = viewModel
    }
}
