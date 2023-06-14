// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A badge indicates a change or notification. It is used to draw the user's attention when needed.
public struct Badge: View {

    private let value: String?

    /// Creates a new `Badge` instance
    /// - Parameters:
    ///   - value: the value to show in the badge
    public init(value: Int) {
        self.value = "\(value)"
    }

    /// Creates a new `Badge` instance
    /// - Parameters:
    ///   - value: the value to show in the badge
    public init(value: String? = nil) {
        self.value = value
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "badge", variant: self.value == nil ? "dot" : nil)) {
            if let value {
                Text(value)
                    .style("title")
                    .accessibilityValue("Badge: \(value)")
                    .frame(minWidth: 16, minHeight: 16)
                    .padding(.horizontal, value.count > 2 ? 3 : 0)
                    .style("background")
            } else {
                Rectangle()
                    .frame(width: 8, height: 8)
                    .overlay {
                        Color.clear.style("background")
                    }.style("background")

            }
        }
    }
}

#if DEBUG
struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Badge()
            Badge(value: 2)
            Badge(value: 20)
            Badge(value: 999)
            Badge(value: 999_000_000)
            Badge(value: "(2)")
            Badge(value: "(99)")
        }
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
