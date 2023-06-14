// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TabbedToolbar: View {

    var tabs: [Tab]

    @Binding var selectedTabIndex: Int

    var body: some View {
        HStack(spacing: 10) {
            ForEach(Array(self.tabs.enumerated()), id: \.offset) { (index, tab) in
                StylableGroup(StylistIdentifier.buildFullIdentifier(
                                for: "button-tabs",
                                variant: index == self.selectedTabIndex ? "selected" : nil)) {
                    Button(
                        action: { self.selectedTabIndex = index },
                        label: {
                            VStack(spacing: 5) {
                                Text(verbatim: tab.title)
                                    .style("title")
                                if let badge = tab.badge {
                                    Text(verbatim: badge)
                                        .style("subtitle")
                                }
                            }
                            .padding(.vertical, 8)
                            .padding(.top, 7)
                        }
                    )
                    .frame(maxWidth: .infinity)
                    .style("background")
                    .addStyledRowDivider(if: index == self.selectedTabIndex)
                }
            }
        }
    }
}
