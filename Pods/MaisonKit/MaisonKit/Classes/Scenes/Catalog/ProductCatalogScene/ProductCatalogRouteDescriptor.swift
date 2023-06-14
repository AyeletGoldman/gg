// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the main product catalog scene
public struct ProductCatalogRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ProductCatalogRouteDescriptor"

    /// An optional initial category to limit results to
    public let category: ProductCategory?

    /// Creates a new `ProductCatalogRouteDescriptor`
    /// - Parameter category: _optional_. An initial category to limit results to.
    public init(category: ProductCategory?) {
        self.category = category
    }
}
