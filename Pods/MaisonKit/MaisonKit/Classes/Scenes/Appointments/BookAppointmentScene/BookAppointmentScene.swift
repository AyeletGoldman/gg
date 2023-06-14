// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct BookAppointmentScene: Scene {

    let clientId: String?
    let onDone: (_ didSave: Bool, UIViewController) -> Void

    init(clientId: String? = nil,
         onDone: @escaping (_ didSave: Bool, UIViewController) -> Void) {
        self.clientId = clientId
        self.onDone = onDone
    }

    func createViewController() -> BookAppointmentViewController {
        return BookAppointmentViewController()
    }

    func configure(controller: BookAppointmentViewController, using factory: SceneFactory) {
        let router = BookAppointmentRouter(controller: controller, factory: factory)
        let viewModel = BookAppointmentViewModel(
            clientId: self.clientId,
            onDone: { [weak controller] didSave in
                guard let controller = controller else { return }
                self.onDone(didSave, controller)
            },
            router: router)
        controller.viewModel = viewModel
    }
}
