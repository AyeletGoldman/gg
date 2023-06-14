// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct Client360DetailsScene: Scene {

    let clientId: String
    let clientName: String?

    init(clientName: String?, clientId: String) {
        self.clientId = clientId
        self.clientName = clientName
    }

    func createViewController() -> Client360DetailsViewController {
        return Client360DetailsViewController()
    }

    func configure(controller: Client360DetailsViewController,
                   using factory: SceneFactory) {
        let router = DefaultClient360DetailsRouter(controller: controller, factory: factory)
        controller.viewModel = Client360DetailsViewModel(title: self.clientName, clientId: self.clientId, router: router)
    }
}
