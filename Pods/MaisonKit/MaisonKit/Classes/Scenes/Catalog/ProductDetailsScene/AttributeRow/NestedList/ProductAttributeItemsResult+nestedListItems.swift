// Copyright © 2023 LVMH. All rights reserved.

import Foundation

public extension ProductAttributeItemsResult {

    /// Creates a new ProductAttributeItemsResult to be used to in product details screen after selecting an attribute.
    /// - Parameters:
    ///   - items: the product attribute items dictionary, attribute id to its items.
    ///   - masterId: the master id this attribute items belong to.
    ///   - productId: the only product id that fits to selected attributes. if there are more than one product that fit to the selection this field supposed to be nil.
    init(items: ProductAttributeItems, masterId: String, productId: String?) {
        self.rows = items.mapValues { NestedProductAttributeRow(items: $0, isShownInCollapsedMode: true) }
        self.masterId = masterId
        self.productId = productId
    }
}
