//  Copyright © 2021 LVMH. All rights reserved.

struct ThemeScene: Scene {

    private let themes: ThemeDisplayable
    private let onSelectionChanged: (ThemeIdentifier) -> Void

    init(themes: ThemeDisplayable,
         onSelectionChanged: @escaping (ThemeIdentifier) -> Void) {
        self.themes = themes
        self.onSelectionChanged = onSelectionChanged
    }

    func createViewController() -> ThemeViewController {
        return ThemeViewController()
    }

    func configure(controller: ThemeViewController,
                   using factory: SceneFactory) {
        let viewModel = ThemeViewModel(themes: self.themes,
                                       onSelectionChanged: self.onSelectionChanged)
        controller.viewModel = viewModel
    }
}
