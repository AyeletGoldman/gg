// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct ProductInfoView: View {

    private enum Labels {
        static let skuCopiedMessage = MKLocalizedString("product-details.product-info.sku-copied.title",
                                                        comment: "A text to appear in a toast message when a user copies the product SKU")
    }

    var title: String
    var subtitle: String?
    var price: String?
    var salePrice: String?
    var productId: String?

    var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "product", variant: "info")) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .firstTextBaseline, spacing: 5) {
                    Text(verbatim: self.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .style("title")
                }
                self.buildSubtitle()
                self.buildPricingSection(price: self.price, salePrice: self.salePrice)
            }
            .padding(.vertical, 20)
            .addStyledRowDivider()
            .padding(.horizontal)
            .style("background")
        }
    }

    @ViewBuilder
    private func buildSubtitle() -> some View {
        Group {
            if let subtitle = self.subtitle, let productId = self.productId {
                HStack {
                    Text(verbatim: subtitle)
                    Text(verbatim: "/")
                    TertiaryButton.copyableText(textToCopy: productId, toastMessage: Labels.skuCopiedMessage)
                }
            } else if let subtitle = self.subtitle {
                Text(verbatim: subtitle)
            } else if let productId = self.productId {
                TertiaryButton.copyableText(textToCopy: productId, toastMessage: Labels.skuCopiedMessage)
            }
        }.style("subtitle")
    }
}
