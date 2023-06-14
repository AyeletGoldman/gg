// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct ProductListScene: Scene {

    private let displayMode: ProductListDisplayMode
    private let shouldPresentFiltersAutomatically: Bool

    init(displayMode: ProductListDisplayMode,
         shouldPresentFiltersAutomatically: Bool = false) {
        self.displayMode = displayMode
        self.shouldPresentFiltersAutomatically = shouldPresentFiltersAutomatically
    }

    func createViewController() -> ProductListViewController {
        return ProductListViewController()
    }

    func configure(controller: ProductListViewController,
                   using factory: SceneFactory) {

        let router = DefaultProductListRouter(controller: controller, factory: factory)
        let viewModel = ProductListViewModel(displayMode: self.displayMode,
                                             shouldPresentFiltersAutomatically: self.shouldPresentFiltersAutomatically,
                                             router: router)
        controller.viewModel = viewModel
        if case .globalSearch = displayMode {
            return // in case of global search the parent view controller presents the search bar
        }
        controller.searchController = factory.createSearchController(searchResultsController: nil)
    }
}
