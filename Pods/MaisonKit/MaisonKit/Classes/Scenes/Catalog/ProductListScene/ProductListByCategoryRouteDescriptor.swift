// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A route descriptor for the product list by category
public struct ProductListByCategoryRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ProductListByCategoryRouteDescriptor"

    /// A category that will limit the results to be part of
    public let selectedCategory: ProductCategory?

    /// Creates a new `ProductListByCategoryRouteDescriptor`
    /// - Parameters:
    ///   - selectedCategory: A category that will limit the results to be part of
    public init(selectedCategory: ProductCategory?) {
        self.selectedCategory = selectedCategory
    }
}
