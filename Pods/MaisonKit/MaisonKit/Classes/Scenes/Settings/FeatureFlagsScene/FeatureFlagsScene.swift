//  Copyright © 2021 LVMH. All rights reserved.

#if DEBUG
struct FeatureFlagsScene: Scene {

    init() {}

    func createViewController() -> FeatureFlagsViewController {
        return FeatureFlagsViewController()
    }

    func configure(controller: FeatureFlagsViewController,
                   using factory: SceneFactory) {
        let viewModel = FeatureFlagsViewModel()
        controller.viewModel = viewModel
    }
}
#endif
