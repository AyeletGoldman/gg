// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

struct FilterButton: View {

    @Environment(\.filterButtonStyle) var style
    @Environment(\.isEnabled) var isEnabled

    let action: () -> Void
    let title: String
    let isSelected: Bool
    let totalItems: Int?

    init(title: String, isSelected: Bool, totalItems: Int? = nil, action: @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.totalItems = totalItems
        self.action = action
    }

    var body: some View {
        Button(action: self.action, label: {
            self.style.makeBody(configuration: FilterButtonStyleConfiguration(title: FilterButtonStyleConfiguration.Title(text: self.title),
                                                                              isSelected: self.isSelected,
                                                                              isEnabled: self.isEnabled,
                                                                              totalItems: self.totalItems))
        }).buttonStyle(.plain)
    }
}

extension FilterButton {
    @ViewBuilder
    func filterButtonStyle<S: FilterButtonStyle>(_ style: S) -> some View {
        self.environment(\.filterButtonStyle, AnyFilterButtonStyle(style))
    }
}
