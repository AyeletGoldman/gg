// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// A scene view that shows and refreshes the product stock details. the data source is shared with the view
/// which manages the refresh event and updates the information.
struct ProductStockScene: Scene {

    let context: ProductDetailsInitialisationContext
    let datasource: ProductStockDatasource
    let onDismiss: (UIViewController) -> Void

    init(context: ProductDetailsInitialisationContext,
         datasource: ProductStockDatasource,
         onDismiss: @escaping (UIViewController) -> Void) {
        self.context = context
        self.datasource = datasource
        self.onDismiss = onDismiss
    }

    func createViewController() -> ProductStockViewController {
        return ProductStockViewController()
    }

    func configure(controller: ProductStockViewController, using factory: SceneFactory) {
        let router = DefaultProductStockRouter(controller: controller, factory: factory)
        let viewModel = ProductStockViewModel(context: self.context,
                                              datasource: self.datasource,
                                              router: router,
                                              onDismiss: { [weak controller] in
                                                guard let controller = controller else { return }
                                                self.onDismiss(controller)
                                              })
        controller.viewModel = viewModel
    }
}
