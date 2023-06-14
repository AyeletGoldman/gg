//  Copyright © 2022 LVMH. All rights reserved.

struct EditClientScene: Scene {

    private let clientID: String
    private let onCancel: (UIViewController) -> Void
    private let onSuccess: (UIViewController) -> Void

    init(clientID: String,
         onCancel: @escaping (UIViewController) -> Void,
         onSuccess: @escaping (UIViewController) -> Void) {
        self.clientID = clientID
        self.onCancel = onCancel
        self.onSuccess = onSuccess
    }

    func createViewController() -> EditClientViewController {
        return EditClientViewController()
    }

    func configure(controller: EditClientViewController,
                   using factory: SceneFactory) {
        let router = DefaultEditClientRouter(controller: controller, factory: factory)
        let viewModel = EditClientViewModel(clientID: self.clientID, router: router, onCancel: { [weak controller] in
            guard let controller = controller else { return }
            self.onCancel(controller)
        }, onSuccess: { [weak controller] in
            guard let controller = controller else { return }
            self.onSuccess(controller)
        })
        controller.viewModel = viewModel
    }
}
