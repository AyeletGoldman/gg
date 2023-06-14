// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct Client360Scene: Scene {

    let clientId: String
    let clientName: String?
    // A closure to use to dismiss this controller if presented modally
    private let onClose: ((UIViewController) -> Void)?

    init(clientId: String, clientName: String?, onClose: ((UIViewController) -> Void)? = nil) {
        self.clientId = clientId
        self.clientName = clientName
        self.onClose = onClose
    }

    func createViewController() -> Client360ViewController {
        return Client360ViewController()
    }

    func configure(controller: Client360ViewController,
                   using factory: SceneFactory) {
        let router = DefaultClient360Router(controller: controller, factory: factory)
        controller.viewModel = Client360ViewModel(clientId: self.clientId,
                                                  clientName: self.clientName,
                                                  router: router)

        // If we have an onClose closure, call it.
        if let onClose = self.onClose {
            controller.onClose = { [weak controller] in
                guard let controller = controller else { return }
                onClose(controller)
            }
        }
    }
}
