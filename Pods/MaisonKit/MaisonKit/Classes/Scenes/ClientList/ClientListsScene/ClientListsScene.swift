// Copyright © 2021 LVMH. All rights reserved.

import Foundation

struct ClientListsScene: Scene {

    private let showSearchInNavigationBar: Bool

    init(showSearchInNavigationBar: Bool) {
        self.showSearchInNavigationBar = showSearchInNavigationBar
    }

    func createViewController() -> ClientListsViewController {
        return ClientListsViewController()
    }

    func configure(controller: ClientListsViewController,
                   using factory: SceneFactory) {

        let router = DefaultClientListsRouter(controller: controller, factory: factory)
        let viewModel = MainClientListViewModel(router: router)
        controller.viewModel = viewModel

        if self.showSearchInNavigationBar {
            let scene = factory.retrieveScene(with: GlobalClientSearchRouteDescriptor(title: nil))

            if let clientSearchController = factory.createViewController(scene) as? UIViewController & UISearchResultsUpdating {
                let searchController = factory.createSearchController(searchResultsController: clientSearchController)
                searchController.searchResultsUpdater = clientSearchController
                controller.searchController = searchController
            }
        }
    }
}
