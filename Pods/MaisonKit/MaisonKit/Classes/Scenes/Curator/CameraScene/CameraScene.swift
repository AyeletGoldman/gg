// Copyright © 2022 LVMH. All rights reserved.

import CoreServices

struct CameraScene: Scene {

    private let onMediaSaved: CameraMediaSavedClosure
    private let onCancel: (UIViewController) -> Void

    init(onMediaSaved: @escaping CameraMediaSavedClosure,
         onCancel: @escaping (UIViewController) -> Void) {
        self.onMediaSaved = onMediaSaved
        self.onCancel = onCancel
    }

    func createViewController() -> CameraViewController {
        return CameraViewController()
    }

    func configure(controller: CameraViewController,
                   using factory: SceneFactory) {
        let viewModel = CameraViewModel(onMediaSaved: { [weak controller] localIdentifier in
            guard let controller = controller else { return }
            self.onMediaSaved(controller, localIdentifier)
        }, onCancel: { [weak controller] in
            guard let controller = controller else { return }
            self.onCancel(controller)
        })
        controller.viewModel = viewModel
        controller.configure()
    }
}
