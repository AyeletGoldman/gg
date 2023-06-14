// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A control to switch between different tabs in a screen. Allows the user to change the interface between two
/// related contents without navigating to a new screen.
public struct TabSwitch: View {

    @Binding private var selectedTab: Tab

    private let tabs: [Tab]

    /// Creates a new `TabSwitch`.
    /// - Parameters:
    ///   - selectedTab: the binding to the selected tab. This tab must be in the array of tabs. If it is not, behaviour is undefined.
    ///   - tabs: the array of tabs to display
    public init(selectedTab: Binding<Tab>, tabs: [Tab]) {
        self._selectedTab = selectedTab
        self.tabs = tabs
    }

    public var body: some View {
        StylableGroup("tabswitch") {
            HStack(spacing: 1) {
                ForEach(self.tabs) { tab in
                    TabButton(title: tab.title,
                              badge: tab.badge,
                              isSelected: self.selectedTab.id == tab.id,
                              onTap: {
                        self.selectedTab = tab
                    })
                }.padding(1)
            }.style("background")
        }
    }
}

#if DEBUG
struct TabSwitch_Previews: PreviewProvider {
    static var tabs: [Tab] {
        return [
            Tab(id: "1",
                title: "Tab 1",
                badge: 1),
            Tab(id: "2",
                title: "Tab 2",
                badge: 30),
            Tab(id: "3",
                title: "Tab 3",
                badge: nil)
        ]
    }
    static var previews: some View {
        TabSwitch(selectedTab: .constant(self.tabs.first!), tabs: self.tabs)
            .padding(.horizontal)
            .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
