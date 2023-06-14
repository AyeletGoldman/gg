// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct AppointmentsScene: Scene {

    init() { }

    func createViewController() -> AppointmentsViewController {
        return AppointmentsViewController()
    }

    func configure(controller: AppointmentsViewController, using factory: SceneFactory) {
        let router = DefaultAppointmentsRouter(controller: controller, factory: factory)
        let viewModel = AppointmentsViewModel(router: router)
        controller.viewModel = viewModel
    }
}
