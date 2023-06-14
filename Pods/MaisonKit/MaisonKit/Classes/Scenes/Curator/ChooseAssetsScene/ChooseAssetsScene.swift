// Copyright © 2022 LVMH. All rights reserved.

struct ChooseAssetsScene: Scene {

    private let getAssetsClosure: GetAssetsClosure
    private let saveSelectedAssetsClosure: SaveSelectedAssetsClosure
    private let onClose: (UIViewController) -> Void

    init(getAssetsClosure: @escaping GetAssetsClosure,
         saveSelectedAssetsClosure: @escaping SaveSelectedAssetsClosure,
         onClose: @escaping (UIViewController) -> Void) {
        self.getAssetsClosure = getAssetsClosure
        self.saveSelectedAssetsClosure = saveSelectedAssetsClosure
        self.onClose = onClose
    }

    func createViewController() -> ChooseAssetsViewController {
        return ChooseAssetsViewController()
    }

    func configure(controller: ChooseAssetsViewController,
                   using factory: SceneFactory) {
        let router = DefaultChooseAssetsRouter(controller: controller, factory: factory)
        let viewModel = ChooseAssetsViewModel(router: router,
                                              getAssetsClosure: self.getAssetsClosure,
                                              saveSelectedAssetsClosure: self.saveSelectedAssetsClosure,
                                              onClose: { [weak controller] in
            guard let controller = controller else { return }
            self.onClose(controller)
        })
        controller.viewModel = viewModel
    }
}
