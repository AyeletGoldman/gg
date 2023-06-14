//  Copyright © 2022 LVMH. All rights reserved.

struct NPSSurveyDetailsScene: Scene {

    private let id: String

    init(id: String) {
        self.id = id
    }

    func createViewController() -> NPSSurveyDetailsViewController {
        return NPSSurveyDetailsViewController()
    }

    func configure(controller: NPSSurveyDetailsViewController,
                   using factory: SceneFactory) {
        let viewModel = NPSSurveyDetailsViewModel(npsID: self.id)
        controller.viewModel = viewModel
    }
}
