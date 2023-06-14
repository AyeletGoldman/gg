// Copyright © 2022 LVMH. All rights reserved.

import Foundation

protocol ActionHandlerViewModel {

    var actionHandlingRouter: ActionScenePresenterRouter { get }

    func handleActionTypeAction(action: MenuAction)

    func handleActionType(action: ActionType)
}

extension ActionHandlerViewModel {
    func handleActionTypeAction(action: MenuAction) {
        self.handleActionType(action: action.type)
    }

    func handleActionType(action: ActionType) {
        switch action {
        case .actionExecutor(let action):
            action()
        case .routeDescriptorProvider(let sceneFactory, let preferredPresentationStyle):
            self.actionHandlingRouter.presentActionScene(factory: sceneFactory,
                                                         preferredPresentationStyle: preferredPresentationStyle)
        case .sceneProvider(let sceneFactory, let preferredPresentationStyle):
            self.actionHandlingRouter.presentActionScene(factory: sceneFactory,
                                                         preferredPresentationStyle: preferredPresentationStyle)
        }
    }
}
