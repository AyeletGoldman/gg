// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// An entry scene to present when we want to share an array of products
struct ShareDataScene: Scene {

    private let title: String
    private let assets: [URL]
    private let adapter: ShareDataAdapter
    private let onClose: ((UIViewController) -> Void)?

    /// Creates a new `ShareDataScene`
    /// - Parameters:
    ///   - title: the title that will be used for this scene
    ///   - assets: the list of assets to share
    ///   - adapter: the adapter protocol methods
    ///   - onClose: a closure to invoke when we have finished the sharing
    init(title: String,
         assets: [URL],
         adapter: ShareDataAdapter,
         onClose: ((UIViewController) -> Void)?) {
        self.title = title
        self.assets = assets
        self.adapter = adapter
        self.onClose = onClose
    }

    func createViewController() -> ShareDataViewController {
        return ShareDataViewController()
    }

    func configure(controller: ShareDataViewController,
                   using factory: SceneFactory) {
        let router = DefaultShareDataRouter(controller: controller, factory: factory)
        let viewModel = ShareDataViewModel(
            title: self.title,
            assets: self.assets,
            adapter: self.adapter,
            onClose: { [weak controller, onClose] in
                guard let controller = controller else { return }
                onClose?(controller)
            }, router: router)
        controller.viewModel = viewModel

        controller.searchController = factory.createSearchController(searchResultsController: nil)
    }
}
