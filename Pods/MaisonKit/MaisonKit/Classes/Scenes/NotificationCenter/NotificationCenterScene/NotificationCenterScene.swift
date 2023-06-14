// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The Scene for NotificationCenter
/// This scene creates and configures a `NotificationCenterViewController`
struct NotificationCenterScene: Scene {

    func createViewController() -> NotificationCenterViewController {
        return NotificationCenterViewController()
    }

    func configure(controller: NotificationCenterViewController,
                   using factory: SceneFactory) {
        let router = DefaultNotificationCenterRouter(controller: controller, factory: factory)
        let viewModel = NotificationCenterViewModel(router: router)
        controller.viewModel = viewModel
    }
}
