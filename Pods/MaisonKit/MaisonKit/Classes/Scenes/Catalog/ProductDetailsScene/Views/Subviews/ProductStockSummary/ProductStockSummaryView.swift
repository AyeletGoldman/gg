// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// An extension to allow easy reference of StylistIdentifier for in-stock and out-of-stock identifiers
public extension StylistIdentifier {

    /// The icon identifier for an item that is in stock.
    static let inStockIconIdentifier: StylistIdentifier = "icon-success"

    /// The icon identifier for an item that is out-of-stock.
    static let outOfStockIconIdentifier: StylistIdentifier = "icon-fail"
}

/// A view to display product stock summary with an optional header.
struct ProductStockSummaryView: View {

    let stockSummary: ProductStockSummaryViewBuilder
    @Binding var privacyMode: PrivacyMode

    var body: some View {
        StylableGroup("block") {
            self.stockSummary
                .makeBody(privacyMode: self.privacyMode)
                .frame(minHeight: 50)
        }
    }
}

struct ProductStockSummaryView_Previews: PreviewProvider {
    @State static var privacyMode: PrivacyMode = .detail

    static var previews: some View {
        Group {
            ProductStockSummaryView(
                stockSummary: GenericProductStockSummary(stockInfo: [
                                                            .init(area: "My store", stockImageIdentifier: .inStockIconIdentifier),
                                                            .init(area: "Nearby", stockImageIdentifier: .outOfStockIconIdentifier),
                                                            .init(area: "Worldwide", stockImageIdentifier: .outOfStockIconIdentifier),
                                                            .init(area: "Online", stockImageIdentifier: .inStockIconIdentifier)]),
                privacyMode: $privacyMode)
            ProductStockSummaryView(
                stockSummary: SpecificProductStockSummary(stockInfo: [
                                                            .init(area: "My Store", amount: "12", isInStock: true),
                                                            .init(area: "Nearby", amount: "13", isInStock: true),
                                                            .init(area: "Worldwide", amount: "100+", isInStock: true),
                                                            .init(area: "Online", amount: "0", isInStock: false)]),
                privacyMode: $privacyMode)
            ProductStockSummaryView(
                stockSummary: PrivacyAwareProductStockSummary(
                    stockInfo: [
                        PrivacyAwareProductStockSummary.Data(area: "My Store",
                                                             amount: "12",
                                                             isInStock: true)]),
                privacyMode: $privacyMode)
        }.environmentObject(Stylist.unstyled)
        .inAllModes()
    }
}
