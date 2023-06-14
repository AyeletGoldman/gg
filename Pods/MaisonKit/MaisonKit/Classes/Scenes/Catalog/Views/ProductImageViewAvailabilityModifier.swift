// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

public struct ProductImageViewAvailabilityModifier: ViewModifier {

    var availability: ProductAvailability?

    public func body(content: Content) -> some View {
        ZStack(alignment: .topLeading) {
            content
            if let availability = availability {
                BadgeView(title: availability.displayName)
                    .badgeViewStyle(StockBadgeViewStyle(variant: availability.stockLevelVariant))
                    .padding(.leading, 10)
                    .padding(.top, 10)
            }
        }
    }
}

extension View {
    func setProductAvailability(_ availability: ProductAvailability?) -> some View {
        self.modifier(ProductImageViewAvailabilityModifier(availability: availability))
    }
}
