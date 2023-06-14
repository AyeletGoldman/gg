// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class ProductCatalogRoutes: NSObject, RouteRegistering {
    /// Registers all product catalog routes.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        self.registerProductCatalogRoute(onto: registry)
        self.registerProductListByCategoryRoute(onto: registry)
        self.registerSimilarProductsRoute(onto: registry)
        self.registerProductSearchRoute(onto: registry)
        self.registerProductDetailsRoute(onto: registry)
        self.registerProductAttributeSelectionRoute(onto: registry)
        self.registerProductStockRoute(onto: registry)
        self.registerProductFiltersRoute(onto: registry)
        self.registerProductSortRoute(onto: registry)
        self.registerBarcodeScanner(onto: registry)
    }
}

private extension ProductCatalogRoutes {

    static func registerProductCatalogRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ProductCatalogRouteDescriptor) in
            return ProductCatalogScene(category: descriptor.category)
        }
    }

    static func registerProductListByCategoryRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ProductListByCategoryRouteDescriptor) in
            return ProductListScene(displayMode: .productCategory(productCategory: descriptor.selectedCategory),
                                    shouldPresentFiltersAutomatically: descriptor.selectedCategory == nil)
        }
    }

    static func registerSimilarProductsRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: SimilarProductsRouteDescriptor) in
            return ProductListScene(displayMode: .similarProducts(productId: descriptor.productId),
                                    shouldPresentFiltersAutomatically: descriptor.shouldPresentFiltersAutomatically)
        }
    }

    static func registerProductSearchRoute(onto registry: SceneRegistry) {
        registry.registerScene { (_: ProductSearchRouteDescriptor) in
            return ProductListScene(displayMode: .globalSearch)
        }
    }

    static func registerProductDetailsRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ProductDetailsRouteDescriptor) in
            return ProductDetailsScene(context: descriptor.context, onClose: descriptor.onClose)
        }
    }

    static func registerProductAttributeSelectionRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ProductAttributeSelectionRouteDescriptor) in
            return ProductAttributeSelectionScene(masterId: descriptor.masterId,
                                                  attribute: descriptor.attribute,
                                                  otherSelectedAttributes: descriptor.otherSelectedAttributes,
                                                  initiallySelectedItemID: descriptor.initiallySelectedItemID,
                                                  shouldShowToolbar: descriptor.shouldShowToolbar,
                                                  onCancel: descriptor.onCancel,
                                                  onSelectedAttributeRemoved: descriptor.onSelectedAttributeRemoved,
                                                  onDone: descriptor.onDone,
                                                  onUpdate: descriptor.onUpdate)
        }
    }

    static func registerProductStockRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ProductStockRouteDescriptor) in
            return ProductStockScene(context: descriptor.context,
                                     datasource: descriptor.datasource,
                                     onDismiss: descriptor.onDismiss)
        }
    }

    static func registerProductFiltersRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ProductFiltersRouteDescriptor) in
            return FiltersScene(dataSource: descriptor.dataSource,
                                title: descriptor.title,
                                onDismiss: descriptor.onDismiss,
                                doneButtonTitle: descriptor.doneButtonTitle,
                                shouldShowToolbar: descriptor.shouldShowToolbar,
                                onDone: descriptor.onDone)
        }
    }

    static func registerProductSortRoute(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ProductSortRouteDescriptor) in
            return SelectionListScene.sortSelectionListScene(items: descriptor.availableSortCriteria,
                                                             selection: descriptor.selectedSort,
                                                             title: descriptor.title,
                                                             onDismiss: descriptor.onDismiss,
                                                             doneButtonTitle: descriptor.doneButtonTitle,
                                                             onDone: descriptor.onDone)
        }
    }

    static func registerBarcodeScanner(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: BarcodeScannerRouteDescriptor) in
            return BarcodeScannerScene(onCancel: descriptor.onCancel,
                                       onDone: descriptor.onDone)
        }
    }
}
