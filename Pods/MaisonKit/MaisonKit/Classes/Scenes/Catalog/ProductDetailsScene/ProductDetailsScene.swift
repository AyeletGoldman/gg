// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct ProductDetailsScene: Scene {

    private let context: ProductDetailsInitialisationContext
    // A closure to use to dismiss this controller if presented modally
    private let onClose: ((UIViewController) -> Void)?

    init(context: ProductDetailsInitialisationContext, onClose: ((UIViewController) -> Void)? = nil) {
        self.context = context
        self.onClose = onClose
    }

    func createViewController() -> ProductDetailsViewController {
        return ProductDetailsViewController()
    }

    func configure(controller: ProductDetailsViewController,
                   using factory: SceneFactory) {
        let router = DefaultProductDetailsRouter(controller: controller, factory: factory)
        let viewModel: ProductDetailsViewModel

        switch self.context {
        case .master(let masterId):
            viewModel = ProductDetailsViewModel(productMasterId: masterId, router: router)
        case .product(let productId, let masterId):
            viewModel = ProductDetailsViewModel(productId: productId, productMasterId: masterId, router: router)
        }
        controller.viewModel = viewModel

        // If we have an onClose closure, call it.
        if let onClose = self.onClose {
            controller.onClose = { [weak controller] in
                guard let controller = controller else { return }
                onClose(controller)
            }
        }
    }
}
