// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A scene view that shows the state of product category rows and decides what view supposed to be shown next based on CatalogScreenType
/// This view fetch the data when the view appears based on selected item in the view model
/// If no item is selected in the view model this view will be used as the root view for catalog tab
struct ProductCatalogScene: Scene {

    private let category: ProductCategory?

    init(category: ProductCategory? = nil) {
        self.category = category
    }

    func createViewController() -> ProductCatalogViewController {
        return ProductCatalogViewController()
    }

    func configure(controller: ProductCatalogViewController,
                   using factory: SceneFactory) {

        let scene = factory.retrieveScene(with: ProductSearchRouteDescriptor())

        let router = DefaultProductCatalogRouter(controller: controller, factory: factory)
        let viewModel = CatalogViewModel(selectedCategory: self.category, router: router)
        controller.viewModel = viewModel

        if let productSearchController = factory.createViewController(scene) as? UIViewController & UISearchResultsUpdating {
            let searchController = factory.createSearchController(searchResultsController: productSearchController)
            searchController.searchResultsUpdater = productSearchController
            controller.searchController = searchController
        }
    }
}
