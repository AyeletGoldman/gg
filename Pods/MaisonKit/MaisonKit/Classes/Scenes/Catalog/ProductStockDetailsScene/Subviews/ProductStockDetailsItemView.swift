// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ProductStockDetailsItemView: View {

    let item: StockInformationItem

    var body: some View {
        StylableGroup("button-action-row") {
            HStack(alignment: .top, spacing: 10) {
                self.buildRowLeading()
                self.builRowTrailing()
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .style("background")
        }
    }

    private var availabilityVariant: AvailabilityVariant {
        return self.item.inStock ? .inStock : .outOfStock
    }

    @ViewBuilder
    private func buildRowLeading() -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "block", variant: self.availabilityVariant.stylistVariant)) {
            VStack(spacing: 0) {
                Text(verbatim: self.item.amountTitle)
                    .style("title")
                Text(verbatim: self.item.amountSubtitle)
                    .style("subtitle")
            }
            .frame(width: 68)
            .frame(minHeight: 60, maxHeight: .infinity)
            .style("background")
        }
    }

    @ViewBuilder
    private func builRowTrailing() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(verbatim: self.item.title)
                .style("title")
            if let subtitle = self.item.subtitle {
                Text(verbatim: subtitle)
                    .style("subtitle")
            }
        }
        .padding(.vertical, 1)
        .padding(.trailing, 10)
    }
}
