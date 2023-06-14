// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The Scene for MyProfile
/// This scene creates and configures a `MyProfileViewController`
struct MyProfileScene: Scene {

    func createViewController() -> MyProfileViewController {
        return MyProfileViewController()
    }

    func configure(controller: MyProfileViewController,
                   using factory: SceneFactory) {
        let router = DefaultMyProfileRouter(controller: controller, factory: factory)
        let viewModel = MyProfileViewModel(router: router)
        controller.viewModel = viewModel
    }
}
