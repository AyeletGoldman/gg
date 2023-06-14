//  Copyright © 2021 LVMH. All rights reserved.

struct PBLAttributeSelectionScene: Scene {

    private let productMasterID: String
    private let initialSelectedAttributes: SelectedProductAttributes
    private let onDone: (UIViewController, String) -> Void
    private let onCancel: (UIViewController) -> Void

    init(productMasterID: String,
         initialSelectedAttributes: SelectedProductAttributes,
         onDone: @escaping ((UIViewController, String) -> Void),
         onCancel: @escaping (UIViewController) -> Void) {
        self.productMasterID = productMasterID
        self.initialSelectedAttributes = initialSelectedAttributes
        self.onDone = onDone
        self.onCancel = onCancel
    }

    func createViewController() -> PBLAttributeSelectionViewController {
        return PBLAttributeSelectionViewController()
    }

    func configure(controller: PBLAttributeSelectionViewController,
                   using factory: SceneFactory) {
        let router = DefaultPBLAttributeSelectionRouter(controller: controller, factory: factory)

        let viewModel = PBLAttributeSelectionViewModel(productMasterID: self.productMasterID,
                                                       initialSelectedAttributes: self.initialSelectedAttributes,
                                                       router: router,
                                                       onDone: { [weak controller, onDone] productId in
            guard let controller = controller else { return }
            onDone(controller, productId)
        },
                                                       onCancel: { [weak controller, onCancel] in
            guard let controller = controller else { return }
            onCancel(controller)
        })
        controller.viewModel = viewModel
    }
}
