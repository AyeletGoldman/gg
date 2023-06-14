// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

/// A tag to show additional information, or additional context to the user.
public struct Tag: View {

    let title: String?
    let icon: ImageSource?
    let padded: Bool
    let variant: TagVariant?

    @Environment(\.tagStyle) private var style

    /// Creates a new `Tag`.
    /// - Parameters:
    ///   - title: The title to use in this tag
    ///   - padded: Whether or not this tag will be vertically padded.
    ///   - variant: The variant to use for this `Tag`
    public init(title: String, padded: Bool = false, variant: TagVariant? = nil) {
        self.title = title
        self.icon = nil
        self.padded = padded
        self.variant = variant
    }

    /// Creates a new `Tag`
    /// - Parameter icon: The icon to display in the tag.
    public init(icon: ImageSource) {
        self.title = nil
        self.icon = icon
        self.padded = false
        self.variant = nil
    }

    public var body: some View {
        self.style
            .makeBody(configuration: TagStyleConfiguration(title: self.title.map { TagStyleConfiguration.Title(text: $0) },
                                                           icon: self.icon.map { TagStyleConfiguration.Icon(source: $0) },
                                                           padded: self.padded,
                                                           variant: self.variant))
            .eraseToAnyView()
    }
}

#if DEBUG
struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                Tag(title: "Default")
                Tag(title: "Primary").tagStyle(.primary)
                Tag(title: "highlighted", variant: .highlighted)
                Tag(title: "Padded", padded: true)
                Tag(title: "Pad + High", padded: true, variant: .highlighted)
            }
            HStack {
                Tag(title: "Secondary").tagStyle(.secondary)
                Tag(title: "highlighted", variant: .highlighted).tagStyle(.secondary)
                Tag(title: "Padded", padded: true).tagStyle(.secondary)
                Tag(title: "Pad + High", padded: true, variant: .highlighted).tagStyle(.secondary)
            }
            HStack {
                Tag(icon: .system(name: "globe.europe.africa")).tagStyle(.primaryIcon)
                    .foregroundColor(.white)
                Tag.mine
            }
        }
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
