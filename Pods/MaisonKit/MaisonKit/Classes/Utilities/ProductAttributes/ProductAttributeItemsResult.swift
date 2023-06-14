// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// The result of `CatalogDetailsAdapter.getProductAttributeItems` that retrieve the product attribute items.
/// `CatalogDetailsAdapter.getProductAttributeItems` will be in use on product details appears or every time after attribute selection change.
/// If there is only one product that fits to selected attributes sent to `getProductAttributeItems`, `productId` field will be initialized with the proper id.
/// In case `productId` is not nil (or different than the previouse result), `CatalogDetailsAdapter.getProductDetails` will be called with the relevant id.
public struct ProductAttributeItemsResult {
    /// The product attribute rows dictionary, attribute id to its row.
    public let rows: ProductAttributeRows
    /// The master id this attribute items belong to.
    /// If `productId` so `masterId` will be in use in `CatalogDetailsAdapter.getProductDetails`
    public let masterId: String
    /// The only product id that fits to selected attributes. if there are more than one product that fit to the selection this field supposed to be nil.
    public let productId: String?

    /// Creates a new ProductAttributeItemsResult to be used to in product details screen after selecting an attribute.
    /// - Parameters:
    ///   - rows: the product attribute rows dictionary, attribute id to its row.
    ///   - masterId: the master id this attribute items belong to.
    ///   - productId: the only product id that fits to selected attributes. if there are more than one product that fit to the selection this field supposed to be nil.
    public init(rows: ProductAttributeRows, masterId: String, productId: String?) {
        self.rows = rows
        self.masterId = masterId
        self.productId = productId
    }
}
