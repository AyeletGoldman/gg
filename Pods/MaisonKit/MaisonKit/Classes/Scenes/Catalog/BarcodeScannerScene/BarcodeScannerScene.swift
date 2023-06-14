//  Copyright © 2022 LVMH. All rights reserved.

struct BarcodeScannerScene: Scene {

    private let onCancel: (UIViewController) -> Void
    private let onDone: (UIViewController, ProductReference) -> Void

    init(onCancel: @escaping (UIViewController) -> Void,
         onDone: @escaping (UIViewController, ProductReference) -> Void) {
        self.onDone = onDone
        self.onCancel = onCancel
    }

    func createViewController() -> BarcodeScannerViewController {
        return BarcodeScannerViewController()
    }

    func configure(controller: BarcodeScannerViewController,
                   using factory: SceneFactory) {
        let viewModel = BarcodeScannerViewModel(onCancel: { [weak controller] in
            guard let controller else { return }
            self.onCancel(controller)
        },
                                                onDone: { [weak controller] in
            guard let controller else { return }
            self.onDone(controller, $0)
        })
        controller.viewModel = viewModel
    }
}
