// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The Scene for Settings
/// This scene creates and configures a `SettingsViewController`
struct SettingsScene: Scene {

    init() { }

    func createViewController() -> SettingsViewController {
        return SettingsViewController()
    }

    func configure(controller: SettingsViewController,
                   using factory: SceneFactory) {
        let router = DefaultSettingsRouter(controller: controller, factory: factory)
        let viewModel = SettingsViewModel(router: router)
        controller.viewModel = viewModel
    }
}
