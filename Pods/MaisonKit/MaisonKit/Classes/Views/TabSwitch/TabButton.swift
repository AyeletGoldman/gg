// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TabButton: View {

    let title: String
    let badge: String?
    let isSelected: Bool
    let onTap: () -> Void

    init(title: String, badge: String?, isSelected: Bool, onTap: @escaping () -> Void) {
        self.title = title
        self.badge = badge
        self.isSelected = isSelected
        self.onTap = onTap
    }

    @ViewBuilder
    private var label: some View {
        HStack(spacing: 4) {
            Text(self.title)
                .style("title")
            if let badge {
                BadgeView(title: badge)
                    .badgeViewStyle(SimpleBadgeViewStyle())
            }
        }
        .padding(.vertical, 6)
        .frame(maxWidth: .infinity)
        .style("background")
    }

    var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "button-tabswitch",
                                                            variant: self.isSelected ? "selected" : nil)) {
            Button(action: self.onTap, label: { self.label })
        }
    }
}
