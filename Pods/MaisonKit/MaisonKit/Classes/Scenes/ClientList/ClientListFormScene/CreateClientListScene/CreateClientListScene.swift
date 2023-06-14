// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Biodag

/// A `Scene` to create and configure a `ClientListFormViewController` for creating new client lists
struct CreateClientListsScene: Scene {

    private let onDone: (ClientListFormViewController) -> Void

    /// Creates a new `CreateClientListScene`.
    /// - Parameter onDone: A closure to invoke when the user has finished creating the client list
    init(onDone: @escaping (ClientListFormViewController) -> Void) {
        self.onDone = onDone
    }

    func createViewController() -> ClientListFormViewController {
        return ClientListFormViewController()
    }

    func configure(controller: ClientListFormViewController,
                   using factory: SceneFactory) {
        let router = DefaultClientListFormRouter(controller: controller, factory: factory)
        let viewModel = ClientListFormViewModel(router: router, onDone: { [weak controller, onDone] in
            guard let controller = controller else { return }
            onDone(controller)
        })
        controller.viewModel = viewModel
    }
}
