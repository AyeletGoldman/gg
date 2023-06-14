//  Copyright © 2021 LVMH. All rights reserved.

struct PBLCopyLinkScene: Scene {

    let orderId: String
    let onDone: (PBLCopyLinkViewController) -> Void

    init(orderId: String, onDone: @escaping (PBLCopyLinkViewController) -> Void) {
        self.orderId = orderId
        self.onDone = onDone
    }

    func createViewController() -> PBLCopyLinkViewController {
        return PBLCopyLinkViewController()
    }

    func configure(controller: PBLCopyLinkViewController,
                   using factory: SceneFactory) {
        let viewModel = PBLCopyLinkViewModel(orderId: self.orderId, onDone: { [weak controller] in
            guard let controller = controller else { return }
            self.onDone(controller)
        })
        controller.viewModel = viewModel
    }
}
