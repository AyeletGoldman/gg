// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension ProductAttributeItem {
    /// Creates a new ProductAttributeItem to be used to in product details select attribute screen.
    /// - Parameters:
    ///   - id: the id for the product attribute item to identify the item selection.
    ///   - title: the title for the product attribute item.
    ///   - availability: the product availability in stock to show next to the item.
    init(id: String, title: String, availability: ProductAvailability) {
        self.init(id: id, title: title, content: .custom(AvailabilitySelectionItemView(availability: availability)))
    }
}
