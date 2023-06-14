// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A route descriptor for thesimilar products
public struct SimilarProductsRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "SimilarProductsRouteDescriptor"

    /// The identifier for showing similar products.
    public let productId: String

    /// Whether or not should the filters menu be presented when opening the similar products screen
    public let shouldPresentFiltersAutomatically: Bool

    /// Creates a new `SimilarProductsRouteDescriptor`
    /// - Parameters:
    ///   - productId: The identifier for showing similar products.
    ///   - shouldPresentFiltersAutomatically: Whether or not the filters menu should be presented when opening the similar products screen
    public init(productId: String, shouldPresentFiltersAutomatically: Bool = true) {
        self.productId = productId
        self.shouldPresentFiltersAutomatically = shouldPresentFiltersAutomatically
    }
}
