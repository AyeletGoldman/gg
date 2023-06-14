//  Copyright © 2022 LVMH. All rights reserved.

struct NPSDetailsScene: Scene {

    private let id: String

    init(id: String) {
        self.id = id
    }

    func createViewController() -> NPSDetailsViewController {
        return NPSDetailsViewController()
    }

    func configure(controller: NPSDetailsViewController,
                   using factory: SceneFactory) {
        let router = DefaultNPSDetailsRouter(controller: controller, factory: factory)
        let viewModel = NPSDetailsViewModel(npsID: self.id, router: router)
        controller.viewModel = viewModel
    }
}
