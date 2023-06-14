// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A control to switch between different tabs in a screen. Allows the user to change the interface between two
/// related contents without navigating to a new screen.
struct TabSwitch: View {

    @Binding private var selectedTabID: Tab.ID

    private let tabs: [Tab]

    /// Creates a new `TabSwitch`.
    /// - Parameters:
    ///   - selectedTabID: the binding to the selected tab. This tab must be in the array of tabs. If it is not, behaviour is undefined.
    ///   - tabs: the array of tabs to display
    init(selectedTabID: Binding<Tab.ID>, tabs: [Tab]) {
        self._selectedTabID = selectedTabID
        self.tabs = tabs
    }

    var body: some View {
        StylableGroup("tabswitch") {
            HStack(spacing: 1) {
                ForEach(self.tabs) { tab in
                    TabButton(title: tab.title,
                              badge: tab.badge,
                              isSelected: self.selectedTabID == tab.id,
                              onTap: {
                        self.selectedTabID = tab.id
                    })
                }.padding(1)
            }.style("background")
        }
    }
}
