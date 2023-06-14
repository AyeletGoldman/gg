// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// The button to use inside buttons form field
public struct FormTypeButton: View {

    @Environment(\.isEnabled) private var isEnabled

    private let title: String
    private let isSelected: Bool
    private let icon: ImageSource?
    private let badge: String?
    private let onTap: () -> Void

    /// Creates a new `FormTypeButton` instance
    /// - Parameters:
    ///   - title: the button title
    ///   - isSelected: whether the button is selected or not
    ///   - icon: optional. an icon to show leading to the title
    ///   - badge: optional. a badge to show next to the title
    ///   - onTap: a closure to invoke when this button is tapped
    public init(title: String,
                isSelected: Bool,
                icon: ImageSource? = nil,
                badge: String? = nil,
                onTap: @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.icon = icon
        self.badge = badge
        self.onTap = onTap
    }

    /// Creates a new `FormTypeButton` instance for multiple selection item
    /// - Parameters:
    ///   - multiSelectTitle: the multiple selection button title
    ///   - isSelected: whether the button is selected or not
    ///   - badge: optional. a badge to show next to the title
    ///   - onTap: a closure to invoke when this button is tapped
    public init(multiSelectTitle title: String,
                isSelected: Bool,
                badge: String? = nil,
                onTap: @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.icon = .styledImage(identifier: "icon-select")
        self.badge = badge
        self.onTap = onTap
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-button",
                                                            variant: FormTypeState.state(isEnabled: self.isEnabled,
                                                                                         isSelected: self.isSelected))) {
            Button {
                self.onTap()
            } label: {
                HStack(spacing: 3) {
                    if let icon {
                        MaisonKitImage(source: icon)
                            .frame(width: 12, height: 12)
                    }
                    Text(self.title)
                        .style("title")
                    if let badge {
                        Badge(value: badge)
                    }
                }
                .contentShape(Rectangle())
            }
            .padding(.vertical, 7)
            .padding(.horizontal, 14)
            .style("background")
        }
    }
}

#if DEBUG
struct FormTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        StylableGroup("form-field") {
            VStack {
                FormTypeButton(title: "With icon", isSelected: false, icon: .system(name: "star"), onTap: {})
                FormTypeButton(title: "Single selection", isSelected: false, onTap: {})
                FormTypeButton(title: "Single selection", isSelected: true, onTap: {})
                FormTypeButton(title: "Single selection", isSelected: false, badge: "(1)", onTap: {})
                FormTypeButton(title: "Single selection", isSelected: true, badge: "(1)", onTap: {})
                FormTypeButton(multiSelectTitle: "Multiple selection", isSelected: false, onTap: {})
                FormTypeButton(multiSelectTitle: "Multiple selection", isSelected: true, onTap: {})
                FormTypeButton(multiSelectTitle: "Multiple selection", isSelected: false, badge: "(1)", onTap: {})
                FormTypeButton(multiSelectTitle: "Multiple selection", isSelected: true, badge: "(1)", onTap: {})
            }
        }
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
