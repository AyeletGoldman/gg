// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct FormTypeTitle: View {

    private let title: String
    private let subtitle: String?
    private let icon: (any View)?
    private let onTap: (() -> Void)?

    /// Creates a new `FormTypeTitle` with the given parameters
    /// - Parameters:
    ///   - title: The title to display in the leading edge of the field.
    ///   - subtitle: Optional. The subtitle to display on the trailing edge of the form type
    ///   - icon: Optional. An icon to display on the leading edge of the label
    ///   - onTap: Optional. A closure to invoke when this element is tapped.
    public init(title: String,
                subtitle: String? = nil,
                icon: ImageSource? = nil,
                onTap: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon.map { MaisonKitImage(source: $0) }
        self.onTap = onTap
    }

    /// Creates a new `FormTypeTitle` with the given parameters
    /// - Parameters:
    ///   - title: The title to display in the leading edge of the field.
    ///   - subtitle: Optional. The subtitle to display on the trailing edge of the form type
    ///   - icon: A closure to invoke to create the icon to be displayed. Use this when you want to animate the view you display.
    ///   - onTap: Optional. A closure to invoke when this element is tapped.
    public init(title: String,
                subtitle: String? = nil,
                icon: () -> any View,
                onTap: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon()
        self.onTap = onTap
    }

    public var body: some View {
        StylableGroup("form-type-title") {
            HStack {
                Text(self.title)
                    .style("title")
                Spacer()
                if let subtitle {
                    Text(subtitle)
                        .style("subtitle")
                }
                if let icon {
                    icon.frame(width: 20, height: 20).eraseToAnyView()
                }
            }.style("background")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if let onTap { onTap() }
        }
    }
}

#if DEBUG
struct FormTypeTitle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FormTypeTitle(title: "Label goes here")
            FormTypeTitle(title: "Title",
                          subtitle: "Subtitle")
            FormTypeTitle(title: "Label goes here", icon: .system(name: "star"))
            FormTypeTitle(title: "Label goes here",
                          subtitle: "Subtitle",
                          icon: .system(name: "star"))
        }
        .padding()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
