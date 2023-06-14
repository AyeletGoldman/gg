// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct DashboardScene: Scene {

    func createViewController() -> DashboardViewController {
        return DashboardViewController()
    }

    func configure(controller: DashboardViewController,
                   using factory: SceneFactory) {
        let router = DefaultDashboardRouter(controller: controller, factory: factory)
        let viewModel = DashboardViewModel(router: router)
        controller.viewModel = viewModel
    }
}
