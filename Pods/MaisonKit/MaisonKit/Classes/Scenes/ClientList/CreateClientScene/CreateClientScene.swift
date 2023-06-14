// Copyright © 2023 LVMH. All rights reserved.

import Foundation

struct CreateClientScene: Scene {

    init() { }

    func createViewController() -> CreateClientViewController {
        return CreateClientViewController()
    }

    func configure(controller: CreateClientViewController, using factory: SceneFactory) {
        controller.viewModel = CreateClientViewModel()
    }
}
