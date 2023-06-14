// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct ActionSheetScene: Scene {

    private let actionSheetContent: ActionSheetContent
    private let onCancel: (UIViewController) -> Void
    private let onSelect: (UIViewController, ActionSheetItem) -> Void

    init(actionSheetContent: ActionSheetContent,
         onCancel: @escaping (UIViewController) -> Void,
         onSelect: @escaping (UIViewController, ActionSheetItem) -> Void) {
        self.actionSheetContent = actionSheetContent
        self.onCancel = onCancel
        self.onSelect = onSelect
    }

    func createViewController() -> ActionSheetViewController {
        return ActionSheetViewController()
    }

    func configure(controller: ActionSheetViewController,
                   using factory: SceneFactory) {
        controller.viewModel = ActionSheetViewModel(actionSheetContent: self.actionSheetContent,
                                                    onCancel: { [weak controller] in
            guard let controller = controller else { return }
            self.onCancel(controller)
        }, onSelect: { [weak controller] item in
            guard let controller = controller else { return }
            self.onSelect(controller, item)
        })
    }
}
