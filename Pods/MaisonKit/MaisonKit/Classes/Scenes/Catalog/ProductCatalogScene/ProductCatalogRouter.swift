// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A router for the product categories 
public protocol ProductCatalogRouter: CuratorPresenterRouter, BarcodeScannerPresenterRouter {

    /// Presents the given category's scene
    /// - Parameter category: the product category for which to show.
    /// This category should be a sub-category of the category that presented it, if there is a parent.
    func presentCategory(_ category: ProductCategory)

    /// Presents a product list
    /// - Parameters:
    ///   - selectedCategory: the category of the product list
    func presentProductList(selectedCategory: ProductCategory?)

    /// Presents the product details screen with the given context
    /// - Parameter context: an initialisation context for the product details screen.
    func presentProductDetails(context: ProductDetailsInitialisationContext)
}

final class DefaultProductCatalogRouter: Router<ProductCatalogViewController>, ProductCatalogRouter, DefaultCuratorPresenterRouter, DefaultBarcodeScannerPresenterRouter {

    func presentCategory(_ category: ProductCategory) {
        let scene = self.factory.retrieveScene(with: ProductCatalogRouteDescriptor(category: category))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    func presentProductList(selectedCategory: ProductCategory?) {
        let scene = self.factory.retrieveScene(with: ProductListByCategoryRouteDescriptor(selectedCategory: selectedCategory))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    func presentProductDetails(context: ProductDetailsInitialisationContext) {
        let scene = self.factory.retrieveScene(with: ProductDetailsRouteDescriptor(context: context))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }
}
