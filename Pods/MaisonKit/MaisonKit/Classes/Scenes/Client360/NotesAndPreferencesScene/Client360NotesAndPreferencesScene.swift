// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct Client360NotesAndPreferencesScene: Scene {

    let clientId: String

    init(clientId: String) {
        self.clientId = clientId
    }

    func createViewController() -> Client360NotesAndPreferencesViewController {
        return Client360NotesAndPreferencesViewController()
    }

    func configure(controller: Client360NotesAndPreferencesViewController,
                   using factory: SceneFactory) {
        controller.viewModel = Client360NotesAndPreferencesViewModel(clientId: self.clientId)
    }
}
