// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct InstructionsScene: Scene {

    private let instructionsData: InstructionsData

    init(instructionsData: InstructionsData) {
        self.instructionsData = instructionsData
    }

    func createViewController() -> InstructionsViewController {
        return InstructionsViewController()
    }

    func configure(controller: InstructionsViewController,
                   using factory: SceneFactory) {
        let router = DefaultInstructionsRouter(controller: controller, factory: factory)
        let viewModel = InstructionsViewModel(outreachType: instructionsData.outreachType,
                                              assetURLs: instructionsData.assetURLs,
                                              template: instructionsData.template,
                                              clientId: instructionsData.clientId,
                                              recipient: instructionsData.recipient,
                                              subject: instructionsData.subject,
                                              message: instructionsData.message,
                                              urlOpener: instructionsData.urlOpener,
                                              router: router,
                                              onDone: instructionsData.onDone)
        controller.viewModel = viewModel
    }
}
