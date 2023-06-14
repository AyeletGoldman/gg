// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// StockInformationObject holds the stock information summary and the drill down items
public struct StockInformationObject {

    /// Holds the summary title, amount for emample
    let title: String

    /// Holds the summary subtitle, units for example
    let subtitle: String

    /// Holds when this stock object was last updated, as a date in string format.
    let lastUpdatedString: String?

    /// Holds stock object information items drill down
    let stockInformationItems: [StockInformationItem]

    /// Creates a new `StockInformationObject`
    /// - Parameters:
    ///   - title: Holds the summary title, amount for emample
    ///   - subtitle: Holds the summary subtitle, units for example
    ///   - stockInformationItems: Holds stock object information items drill down
    ///   - lastUpdated: Holds when this stock object was last updated, as a date in string format.
    public init(title: String,
                subtitle: String,
                stockInformationItems: [StockInformationItem] = [],
                lastUpdated: String?) {
        self.title = title
        self.subtitle = subtitle
        self.lastUpdatedString = lastUpdated
        self.stockInformationItems = stockInformationItems
    }
}
