// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The data available to be displayed when sharing product data
public struct ProductShareData {

    /// The product ID to share
    public let productId: String

    /// A list of image URLs to share with the client
    public let productImageURLs: [URL]

    /// Creates a new `ProductShareData` instance.
    /// - Parameters:
    ///   - productId: The product ID to share
    ///   - productImageURLs: A list of image URLs to share with the client
    public init(productId: String,
                productImageURLs: [URL]) {
        self.productId = productId
        self.productImageURLs = productImageURLs
    }
}
