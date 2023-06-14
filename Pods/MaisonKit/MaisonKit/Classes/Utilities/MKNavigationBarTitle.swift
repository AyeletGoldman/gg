// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

public extension View {
    /// Sets up the navigation bar with leading and trailing views
    /// - Parameters:
    ///   - leading: a view to set as the leading view
    ///   - trailing: a view to set as the trailing view
    /// - Returns: the view configured with the given leading and trailing views
    @ViewBuilder
    func setNavigationBarItems<Leading: View, Trailing: View>(@ViewBuilder leading: () -> Leading, @ViewBuilder trailing: () -> Trailing) -> some View {
        self.toolbar {
            self.buildToolBarItem(placement: .navigationBarLeading, label: leading)
            self.buildToolBarItem(placement: .navigationBarTrailing, label: trailing)
        }
    }

    /// Sets up the navigation bar with leading view
    /// - Parameters:
    ///   - leading: a view to set as the leading view
    /// - Returns: the view configured with the given leading view
    @ViewBuilder
    func setNavigationBarItems<Leading: View>(@ViewBuilder leading: () -> Leading) -> some View {
        self.toolbar {
            self.buildToolBarItem(placement: .navigationBarLeading, label: leading)
        }
    }

    /// Sets up the navigation bar with trailing view
    /// - Parameters:
    ///   - trailing: a view to set as the trailing view
    /// - Returns: the view configured with the given trailing view
    @ViewBuilder
    func setNavigationBarItems<Trailing: View>(@ViewBuilder trailing: () -> Trailing) -> some View {
        self.toolbar {
            self.buildToolBarItem(placement: .navigationBarTrailing, label: trailing)
        }
    }

    private func buildToolBarItem<Label: View>(placement: ToolbarItemPlacement, label: () -> Label) -> some ToolbarContent {
        // SwiftUI is trying to be smart and when we only have a button in the view it takes over styling.
        // This is a workaround.
        return ToolbarItem(placement: placement) {
            HStack {
                Spacer(minLength: 0)
                label()
            }
        }
    }
}
