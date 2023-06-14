// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// StockInformationItem holds a stock information item, held in the stock information object item array.
public struct StockInformationItem {

    /// Holds the product amountTitle for this item
    let amountTitle: String

    /// Holds the product amountSubtitle for this item
    let amountSubtitle: String

    /// Holds the stock status
    let inStock: Bool

    /// Holds the stock item's title.
    let title: String

    /// Holds the stock item's subtitle.
    let subtitle: String?

    /// Creates a new `StockInformationItem`
    /// - Parameters:
    ///   - amountTitle: Holds the product amountTitle for this item
    ///   - amountSubtitle: Holds the product amountSubtitle for this item
    ///   - inStock: Holds the stock status e.g. whether the item is in stock or not
    ///   - title: Holds the stock item's title.
    ///   - subtitle: Holds the stock item's subtitle.
    public init(amountTitle: String,
                amountSubtitle: String,
                inStock: Bool,
                title: String,
                subtitle: String? = nil) {
        self.amountTitle = amountTitle
        self.amountSubtitle = amountSubtitle
        self.inStock = inStock
        self.title = title
        self.subtitle = subtitle
    }
}
