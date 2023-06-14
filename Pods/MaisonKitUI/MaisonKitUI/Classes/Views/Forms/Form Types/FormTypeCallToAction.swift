// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct FormTypeCallToAction: View {

    @Environment(\.isEnabled) private var isEnabled

    private let title: String
    private let icon: ImageSource?
    private let onTap: () -> Void

    /// Creates a new `FormTypeCallToAction` with the given parameters
    /// - Parameters:
    ///   - title: The title to display in the middle of the field.
    ///   - icon: An icon to display on the leading edge of the label
    ///   - onTap: a closure to invoke when this field is tapped
    public init(title: String, icon: ImageSource? = nil, onTap: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.onTap = onTap
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-cta",
                                                            variant: self.isEnabled ? nil : FormTypeState.disabled)) {
            Button {
                self.onTap()
            } label: {
                HStack(spacing: 2) {
                    if let icon {
                        MaisonKitImage(source: icon)
                            .frame(width: 12, height: 12)
                    }
                    Text(self.title)
                        .style("title")
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
            }
            .buttonStyle(.tertiary)
            .style("background")
        }
    }
}

#if DEBUG
struct FormTypeCallToAction_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FormTypeCallToAction(title: "Label goes here", onTap: {})
            FormTypeCallToAction(title: "Label goes here", icon: .system(name: "star"), onTap: {})
        }
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
