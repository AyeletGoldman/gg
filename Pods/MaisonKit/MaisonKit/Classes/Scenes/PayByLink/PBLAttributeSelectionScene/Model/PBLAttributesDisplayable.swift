// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A set of attributes and product IDs that allow displaying the information in the attribute selection flow.
public struct PBLAttributesDisplayable {
    /// The master ID this attribute displayable belong to. This is, the product's master ID.
    public let masterId: String
    /// The only product ID that fits the selected attributes. If there are many products that fit the attributes and items this should be set  to `nil`.
    public let productId: String?
    /// The attributes that are shown on the list; i.e. the attribute category and the attribute selected for that category
    public let attributes: ProductAttributes

    /// Creates a new `PBLAttributesDisplayable`
    /// - Parameters:
    ///   - masterId: The master ID this attribute items belong to.
    ///   - productId: The only product ID that fits the selected attributes. If there are many products that fit the attributes and items this should be set  to `nil`.
    ///   - attributes: The attributes that are shown on the list; i.e. the attribute category and the attribute selected for that category
    public init(masterId: String,
                productId: String?,
                attributes: ProductAttributes) {
        self.masterId = masterId
        self.productId = productId
        self.attributes = attributes
    }
}
