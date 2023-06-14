// Copyright © 2021 LVMH. All rights reserved.

import Combine

struct TemplateSelectionScene: Scene {

    private let outreachFlowItem: OutreachFlowItem
    private let assetURLs: [URL]
    private let getTemplates: GetTemplatesMethod
    private let onDone: OutreachResultClosure
    private let onCancel: ((UIViewController) -> Void)?

    init(outreachFlowItem: OutreachFlowItem,
         assetURLs: [URL],
         getTemplates: @escaping GetTemplatesMethod,
         onDone: @escaping OutreachResultClosure,
         onCancel: ((UIViewController) -> Void)?) {
        self.outreachFlowItem = outreachFlowItem
        self.assetURLs = assetURLs
        self.getTemplates = getTemplates
        self.onDone = onDone
        self.onCancel = onCancel
    }

    func createViewController() -> TemplateSelectionViewController {
        return TemplateSelectionViewController()
    }

    func configure(controller: TemplateSelectionViewController,
                   using factory: SceneFactory) {
        let router = DefaultTemplateSelectionRouter(controller: controller, factory: factory)
        let viewModel = TemplateSelectionViewModel(outreachFlowItem: self.outreachFlowItem,
                                                   assetURLs: self.assetURLs,
                                                   getTemplates: self.getTemplates,
                                                   onDone: self.onDone,
                                                   router: router)
        controller.viewModel = viewModel

        // If we have an onCancel closure, call it.
        if let onCancel = self.onCancel {
            controller.onCancel = { [weak controller] in
                guard let controller = controller else { return }
                onCancel(controller)
            }
        }
    }
}
