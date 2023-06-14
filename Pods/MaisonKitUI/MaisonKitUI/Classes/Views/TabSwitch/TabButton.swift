// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TabButton: View {

    let title: String
    let badge: Int?
    let isSelected: Bool
    let onTap: () -> Void

    init(title: String, badge: Int?, isSelected: Bool, onTap: @escaping () -> Void) {
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
            if let badge, badge > 0 {
                Badge(value: badge)
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

#if DEBUG
struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TabButton(title: "Label", badge: nil, isSelected: false, onTap: { })
            TabButton(title: "Label", badge: 1, isSelected: false, onTap: { })
            TabButton(title: "Label", badge: nil, isSelected: true, onTap: { })
            TabButton(title: "Label", badge: 1, isSelected: true, onTap: { })
        }
        .padding(.horizontal)
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
