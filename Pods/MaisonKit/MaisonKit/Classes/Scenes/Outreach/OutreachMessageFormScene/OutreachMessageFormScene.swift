// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct OutreachMessageFormScene: Scene {

    private let outreachType: OutreachType
    private let assetURLs: [URL]
    private let clientId: String
    private let recipient: String?
    private let template: Template?
    private let validator: OutreachValidator?
    private let onDone: OutreachResultClosure

    init(outreachType: OutreachType,
         assetURLs: [URL],
         clientId: String,
         recipient: String?,
         template: Template?,
         validator: OutreachValidator?,
         onDone: @escaping OutreachResultClosure) {
        self.outreachType = outreachType
        self.assetURLs = assetURLs
        self.clientId = clientId
        self.recipient = recipient
        self.onDone = onDone
        self.validator = validator
        self.template = template
    }

    func createViewController() -> OutreachMessageFormViewController {
        return OutreachMessageFormViewController()
    }

    func configure(controller: OutreachMessageFormViewController,
                   using factory: SceneFactory) {
        let router = DefaultOutreachMessageFormRouter(controller: controller, factory: factory)
        let viewModel = OutreachMessageViewModel(outreachType: self.outreachType,
                                                 assetURLs: self.assetURLs,
                                                 clientId: self.clientId,
                                                 recipient: self.recipient,
                                                 template: self.template,
                                                 validator: self.validator ?? OutreachValidator(),
                                                 onDone: { [weak controller] result in
                                                    guard let controller = controller else { return }
                                                    self.onDone(controller, result)
                                                 },
                                                 router: router)
        controller.viewModel = viewModel
    }
}
