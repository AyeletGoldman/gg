// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct OutreachSelectionScene: Scene {

    private let getOutreachActions: GetOutreachActionsMethod
    private let outreachFlowContainer: OutreachFlowContainer?
    private let onCancel: (UIViewController) -> Void
    private let onSelected: ((OutreachType, String?, UIViewController) -> Void)?

    init(getOutreachActions: @escaping GetOutreachActionsMethod,
         onCancel: @escaping (UIViewController) -> Void,
         onSelected: @escaping (OutreachType, String?, UIViewController) -> Void) {
        self.getOutreachActions = getOutreachActions
        self.onCancel = onCancel
        self.onSelected = onSelected
        self.outreachFlowContainer = nil
    }

    init(getOutreachActions: @escaping GetOutreachActionsMethod,
         onCancel: @escaping (UIViewController) -> Void,
         outreachFlowContainer: OutreachFlowContainer) {
        self.getOutreachActions = getOutreachActions
        self.onCancel = onCancel
        self.onSelected = nil
        self.outreachFlowContainer = outreachFlowContainer
    }

    func createViewController() -> OutreachSelectionViewController {
        return OutreachSelectionViewController()
    }

    func configure(controller: OutreachSelectionViewController,
                   using factory: SceneFactory) {
        let onSelected: ((OutreachType, String?) -> Void)? = self.onSelected.map { closure in
            return { [weak controller] type, recipient in
                guard let controller = controller else { return }
                closure(type, recipient, controller)
            }
        }
        controller.viewModel = OutreachSelectionViewModel(getOutreachActions: self.getOutreachActions,
                                                          router: DefaultOutreachSelectionRouter(controller: controller,
                                                                                                 factory: factory),
                                                          onSelected: onSelected,
                                                          outreachFlowContainer: self.outreachFlowContainer,
                                                          onCancel: { [weak controller] in
            guard let controller = controller else { return }
            self.onCancel(controller)
        })
    }
}
