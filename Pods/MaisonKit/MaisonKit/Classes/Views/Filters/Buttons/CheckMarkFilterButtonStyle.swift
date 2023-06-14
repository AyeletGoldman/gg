// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct CheckMarkFilterButtonStyle: FilterButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "button-filters",
                                                            variant: self.getVariant(for: configuration))) {
            HStack(spacing: 2) {
                MaisonKitImage(source: .styledImage(identifier: configuration.isSelected ? "icon-check" : "icon-add"))
                    .frame(width: 10, height: 10)
                    .padding(.trailing, 2)
                configuration.title.style("title")
                if let totalItems = configuration.totalItems {
                    FilterItemTotalItemsView(totalItems: totalItems)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14))
            .style("background")
        }
    }
}

extension FilterButtonStyle where Self == CheckMarkFilterButtonStyle {
    static var checkmark: CheckMarkFilterButtonStyle {
        CheckMarkFilterButtonStyle()
    }
}
