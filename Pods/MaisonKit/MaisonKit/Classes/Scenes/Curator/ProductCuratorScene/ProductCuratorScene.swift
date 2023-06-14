//  Copyright © 2021 LVMH. All rights reserved.

struct ProductCuratorScene: Scene {

    let onClose: (UIViewController) -> Void

    init(onClose: @escaping (UIViewController) -> Void) {
        self.onClose = onClose
    }

    func createViewController() -> ProductCuratorViewController {
        return ProductCuratorViewController()
    }

    func configure(controller: ProductCuratorViewController,
                   using factory: SceneFactory) {
        let viewModel = ProductCuratorViewModel(router: DefaultProductCuratorRouter(controller: controller, factory: factory),
                                                onClose: { [weak controller] in
                                                    guard let controller = controller else { return }
                                                    self.onClose(controller)
                                                })
        controller.viewModel = viewModel
    }
}
