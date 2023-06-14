// Copyright © 2022 LVMH. All rights reserved.

import Foundation

struct TimelineClientEventScene: Scene {

    private let mode: TimelineClientEventSceneMode
    private let eventType: TimelineClientEventType
    private let onDismiss: ((UIViewController) -> Void)?

    init(mode: TimelineClientEventSceneMode,
         eventType: TimelineClientEventType,
         onDismiss: ((UIViewController) -> Void)?) {
        self.mode = mode
        self.eventType = eventType
        self.onDismiss = onDismiss
    }

    func createViewController() -> TimelineClientEventViewController {
        return TimelineClientEventViewController()
    }

    func configure(controller: TimelineClientEventViewController,
                   using factory: SceneFactory) {
        let router = DefaultTimelineClientEventRouter(controller: controller, factory: factory)
        let onDismiss = self.onDismiss.map { onDismiss in
            return { [weak controller] in
                guard let controller = controller else { return }
                onDismiss(controller)
            }
        }
        let viewModel = TimelineClientEventViewModel(mode: self.mode,
                                                     eventType: self.eventType,
                                                     router: router,
                                                     onDismiss: onDismiss)
        controller.viewModel = viewModel
    }
}
