// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

struct AvailabilitySelectionItemView: SelectionItemContentView {
    let availability: ProductAvailability

    func makeBody() -> AnyView {
        BadgeView(title: self.availability.displayName)
            .badgeViewStyle(StockBadgeViewStyle(variant: self.availability.stockLevelVariant))
            .eraseToAnyView()
    }
}
