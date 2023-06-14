//  Copyright © 2021 LVMH. All rights reserved.

struct PBLConfirmOrderScene: Scene {

    let orderId: String
    private let onClose: ((UIViewController) -> Void)
    private let onShareCompletion: (UIViewController) -> Void

    init(orderId: String,
         onClose: @escaping ((UIViewController) -> Void),
         onShareCompletion: @escaping (UIViewController) -> Void) {
        self.orderId = orderId
        self.onClose = onClose
        self.onShareCompletion = onShareCompletion
    }

    func createViewController() -> PBLConfirmOrderViewController {
        return PBLConfirmOrderViewController()
    }
    func configure(controller: PBLConfirmOrderViewController,
                   using factory: SceneFactory) {
        let router = DefaultPBLConfirmOrderRouter(controller: controller, factory: factory)
        let viewModel = PBLConfirmOrderViewModel(orderId: self.orderId,
                                                 router: router,
                                                 onClose: { [weak controller, onClose] in
                                                    guard let controller = controller else { return }
                                                    onClose(controller)
                                                 },
                                                 onShareCompletion: { [weak controller, onShareCompletion] in
                                                    guard let controller = controller else { return }
                                                    onShareCompletion(controller)
                                                 })
        controller.viewModel = viewModel
    }
}
