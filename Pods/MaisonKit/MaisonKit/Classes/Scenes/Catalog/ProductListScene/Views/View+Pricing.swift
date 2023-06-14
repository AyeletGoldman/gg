// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

extension View {
    @ViewBuilder
    func buildPricingSection(price: String?, salePrice: String?) -> some View {
        if price == nil, salePrice == nil {
            EmptyView()
        } else {
            HStack(spacing: 5) {
                if let primaryPrice = self.getPrimaryPrice(price: price, salePrice: salePrice) {
                    BadgeView(title: primaryPrice)
                        .badgeViewStyle(PrimaryBadgeViewStyle(variant: salePrice == nil ? nil : "highlighted",
                                                              verticalPadding: 4))
                }
                if let secondaryPrice = self.getSecondaryPrice(price: price, salePrice: salePrice) {
                    BadgeView(title: secondaryPrice)
                        .badgeViewStyle(SecondaryBadgeViewStyle(verticalPadding: 8))
                }
            }
        }
    }

    private func getPrimaryPrice(price: String?, salePrice: String?) -> String? {
        if let salePrice = salePrice {
            return salePrice
        }
        return price
    }

    private func getSecondaryPrice(price: String?, salePrice: String?) -> String? {
        if salePrice == nil {
            return nil
        }
        return price
    }
}
