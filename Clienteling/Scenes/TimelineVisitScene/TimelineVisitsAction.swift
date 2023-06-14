// Kenzo Clienteling
// 20/01/2022

import MaisonKit

extension ContextualAction {
    
    static func timelineVisitAction(clientId: String, actionType: TimlineActionType) -> ContextualAction {
        return ContextualAction(localizedTitle: MKLocalizedString(actionType.title, comment: ""),
                                preferredPresentationStyle: .modal,
                                sceneFactory: { _ in
            return TimelineVisitScene(clientId: clientId, actionType: actionType ,  onDone: { controller in
                controller.dismiss(animated: true)
            })
        })
    }
}
