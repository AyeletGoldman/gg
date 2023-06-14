// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A small component that usually has a title and subtitle. Usually used to display individual key-value pairs where the
/// value requires a more prominent display than the key.
public struct Block: View {

    private let title: String?
    private let subtitle: String?
    private let iconIdentifier: StylistIdentifier?
    private let variant: String?

    @Environment(\.blockStyle) private var style

    /// Creates a new `Block`. The view is wrapped in a `block` identifier with the given variant.
    /// - Parameters:
    ///   - title: The more prominent of the text displays in the view. Usually displayed above the subtitle.
    ///   - subtitle: The less prominent of the text displays in the view. Usually dislplayed below the title.
    ///   - iconIdentifier: If the style of this block shows the icon, usually it will replace the title. This is an icon identifier.
    ///   - variant: The stylist variant to apply to this block. If you pass in a variant, the `block` wrapper will be styled with it. For example `block[variant]`.
    public init(title: String? = nil,
                subtitle: String? = nil,
                iconIdentifier: StylistIdentifier? = nil,
                variant: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.iconIdentifier = iconIdentifier
        self.variant = variant
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "block", variant: self.variant)) {
            self.style.makeBody(configuration: BlockStyleConfiguration(title: self.title.map {  BlockStyleConfiguration.Title(text: $0) },
                                                                       subtitle: self.subtitle.map { BlockStyleConfiguration.Subtitle(text: $0) },
                                                                       icon: self.iconIdentifier.map { BlockStyleConfiguration.Icon(identifier: $0) }))
            .eraseToAnyView()
            .padding(5)
            .style("background")
        }
    }
}

#if DEBUG
struct Block_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                Block(title: "Value", subtitle: "Label")
                Block(title: "Value", subtitle: "Label", variant: "available")
                Block(title: "Value", subtitle: "Label", variant: "out-of-stock")
            }
            Block(iconIdentifier: "icon-info").blockStyle(IconBlockStyle())
            VStack {
                Block(subtitle: "Label", iconIdentifier: "icon-info").blockStyle(LabeledIconBlockStyle())
            }
        }
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
