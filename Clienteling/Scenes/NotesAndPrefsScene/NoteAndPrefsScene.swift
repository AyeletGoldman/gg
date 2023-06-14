// Copyright © 2022 LVMH. All rights reserved.

import MaisonKit

struct NoteAndPrefsScene: Scene {

    private let clientId: String
    
    init (clientId: String) {
        self.clientId = clientId
    }

    func createViewController() -> NoteAndPrefsViewController {
        return NoteAndPrefsViewController()
    }

    func configure(controller: NoteAndPrefsViewController, using factory: SceneFactory) {
        let router = NoteAndPrefsRouter(controller: controller, factory: factory)
        let viewModel = NoteAndPrefsViewModel(router: router, clientId: clientId)
        controller.viewModel = viewModel
    }
}
