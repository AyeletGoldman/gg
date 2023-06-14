// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct FilterItemTotalItemsView: View {

    private enum Labels {
        static let filterItemTotalItems = MKLocalizedString("filters.item.total-items.title",
                                                            comment: "The total matched items title in filter item. The placeholder is the total items intager.")
    }

    let totalItems: Int

    var body: some View {
        BadgeView(title: String(format: Labels.filterItemTotalItems, self.totalItems))
            .badgeViewStyle(SimpleBadgeViewStyle())
    }
}
