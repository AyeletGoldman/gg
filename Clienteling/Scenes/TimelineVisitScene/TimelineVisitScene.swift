// Kenzo Clienteling
// 20/01/2022

import MaisonKit

struct TimelineVisitScene: Scene {

    private let actionType: TimlineActionType
    private let clientId: String
    private let onDone: (UIViewController) -> Void

    init(clientId: String, actionType: TimlineActionType, onDone: @escaping (UIViewController) -> Void) {
        self.clientId = clientId
        self.actionType = actionType
        self.onDone = onDone
    }
    
    func createViewController() -> TimelineVisitViewController {
        return TimelineVisitViewController()
    }
    
    func configure(controller: TimelineVisitViewController, using factory: SceneFactory) {
        let router = DefaultGenericFormRouter(controller: controller, factory: factory)
        let viewModel = TimelineVisitViewModel(clientId: self.clientId, actionType: self.actionType, onDone: { [weak controller] in
            guard let controller = controller else { return }
            self.onDone(controller)
        }, router: router)
        controller.viewModel = viewModel
    }
}
