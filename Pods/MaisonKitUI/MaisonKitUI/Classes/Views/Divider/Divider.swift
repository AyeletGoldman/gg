// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view to separate distinct elements in a user interface.
/// Typically this is used to separate items in a list
public struct Divider: View {

    private var variant: String?
    private var title: String?

    /// Creates a new `Divider` with a given `variant` to create a `StylableGroup`.
    /// - Parameter variant: the stylist identifier variant to use for the divider
    public init(variant: String? = nil) {
        self.variant = variant
        self.title = nil
    }

    /// Creates a new `Divider` with a title. The title will be in the center of the divider, as a `Text` element styled with `title`.
    /// Using this initialiser sets the `variant` to `title`.
    /// - Parameter title: a string to show in the center of the divider.
    public init(title: String) {
        self.variant = "title"
        self.title = title
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "divider", variant: self.variant)) {
            if let title = self.title {
                ZStack(alignment: .center) {
                    self.divider
                    Text(title)
                        .style("title")
                        .accessibilityValue(title)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 4)
                        .style("overlay")
                }
            } else {
                // We used to use a `Divider` here, but it is difficult to style
                // with the stylist (the background property didn't seem to work very well with clear backgrounds)
                // So instead we use a `Rectangle` of height 1 and set the foreground and accent colors to `.clear`.
                self.divider
            }
        }.accessibilityLabel("divider")
    }

    @ViewBuilder
    private var divider: some View {
        Rectangle().frame(maxWidth: .infinity,
                          minHeight: 1,
                          idealHeight: 1,
                          maxHeight: 1)
        .accentColor(.clear)
        .foregroundColor(.clear)
        .style("background")
    }
}

#if DEBUG
struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Divider(title: "Label")
            Divider()
        }
        .frame(width: 300)
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
