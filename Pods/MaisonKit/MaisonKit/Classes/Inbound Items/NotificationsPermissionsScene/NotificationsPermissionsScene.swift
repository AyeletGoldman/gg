//  Copyright © 2021 LVMH. All rights reserved.

struct NotificationsPermissionsScene: Scene {

    private let onDone: (UIViewController, Bool) -> Void

    init(onDone: @escaping (UIViewController, Bool) -> Void) {
        self.onDone = onDone
    }

    func createViewController() -> NotificationsPermissionsViewController {
        return NotificationsPermissionsViewController()
    }

    func configure(controller: NotificationsPermissionsViewController,
                   using factory: SceneFactory) {
        let viewModel = NotificationsPermissionsViewModel(onDone: { wasCancelled in
            self.onDone(controller, wasCancelled)
        })
        controller.viewModel = viewModel
    }
}
