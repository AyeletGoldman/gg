// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct PlainFilterButtonStyle: FilterButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "button-filters",
                                                            variant: self.getVariant(for: configuration))) {
            HStack(spacing: 2) {
                configuration.title
                    .style("title")
                if let totalItems = configuration.totalItems {
                    FilterItemTotalItemsView(totalItems: totalItems)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14))
            .style("background")
        }
    }
}

extension FilterButtonStyle where Self == PlainFilterButtonStyle {
    static var plain: PlainFilterButtonStyle {
        PlainFilterButtonStyle()
    }
}
