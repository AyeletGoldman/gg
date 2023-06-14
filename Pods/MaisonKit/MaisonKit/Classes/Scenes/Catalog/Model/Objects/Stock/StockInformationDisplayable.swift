// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// StockInformationDisplayable holds the stock onformation builder to display in the product detail page
/// and the items to display in the StockInformationView.
public struct StockInformationDisplayable {

    /// Holds the information and items to display in the StockInformationView.
    public let items: [StockInformationObject]?

    /// Holds the summary to display in the product details page.
    public var stockSummary: ProductStockSummaryViewBuilder

    /// Creates a new `StockInformationDisplayable`
    /// - Parameters:
    ///   - items: Holds the information and items to display in the StockInformationView.
    ///   - stockSummary: Holds the summary to display in the product details page.
    public init(items: [StockInformationObject]? = nil,
                stockSummary: ProductStockSummaryViewBuilder) {
        self.items = items
        self.stockSummary = stockSummary
    }
}

extension StockInformationDisplayable {
    static let loadingDisplayable = StockInformationDisplayable(
        items: [
            .init(title: "My store", subtitle: "34", lastUpdated: nil),
            .init(title: "My store", subtitle: "34", lastUpdated: "Jan 3, 2002"),
            .init(title: "My store", subtitle: "34", lastUpdated: "last wednesday"),
            .init(title: "My store", subtitle: "34", lastUpdated: "2 hours ago")
        ],
        stockSummary: PrivacyAwareProductStockSummary(stockInfo: [
            PrivacyAwareProductStockSummary.Data(area: "Loading",
                                                 amount: "0",
                                                 isInStock: false)
        ])
    )
}
