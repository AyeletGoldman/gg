//  Copyright © 2023 LVMH. All rights reserved.

struct EditClientConfirmationScene: Scene {

    private let data: AnyFormData
    private let clientID: String
    private let onSuccess: () -> Void

    init(clientID: String, data: AnyFormData, onSuccess: @escaping () -> Void) {
        self.clientID = clientID
        self.data = data
        self.onSuccess = onSuccess
    }

    func createViewController() -> EditClientConfirmationViewController {
        return EditClientConfirmationViewController()
    }

    func configure(controller: EditClientConfirmationViewController,
                   using factory: SceneFactory) {
        let router = DefaultGenericFormRouter(controller: controller, factory: factory)
        let viewModel = EditClientConfirmationViewModel(clientID: self.clientID,
                                                        data: self.data,
                                                        onSuccess: self.onSuccess,
                                                        router: router)
        controller.viewModel = viewModel
    }
}
