// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// An image type, ideal for colour or size options. Supports, short text (max 3 chars recommended), color & images
public struct FormTypeImage: View {

    @Environment(\.isEnabled) private var isEnabled

    private let isSelected: Bool
    private let onTap: () -> Void
    private let content: any View
    private let subtitle: String?
    private let badge: String?

    /// Creates a new `FormTypeImage` with the given parameters
    /// - Parameters:
    ///   - title: The title to display in the middle of the field. This is usually just a few letters (< 5). If you have long titles
    ///   - subtitle: Optional. The subtitle to display on the bottom of the form type
    ///   - badge: optional. a badge to show next to the title
    ///   - isSelected: whether the field is in selected mode or not.
    ///   - onTap: a closure to invoke when this field is tapped
    public init(title: String,
                subtitle: String? = nil,
                badge: String? = nil,
                isSelected: Bool,
                onTap: @escaping () -> Void) {
        self.subtitle = subtitle
        self.badge = badge
        self.isSelected = isSelected
        self.onTap = onTap

        self.content = Text(title)
            .lineLimit(1)
            .truncationMode(.tail)
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .frame(minWidth: 60)
            .style("title")
    }

    /// Creates a new `FormTypeImage` with the given parameters
    /// - Parameters:
    ///   - image: an image to use for the content of the form field
    ///   - subtitle: Optional. The subtitle to display on the bottom of the form type
    ///   - badge: optional. a badge to show next to the title
    ///   - isSelected: whether the field is in selected mode or not.
    ///   - onTap: a closure to invoke when this field is tapped
    public init(image: ImageSource,
                subtitle: String? = nil,
                badge: String? = nil,
                isSelected: Bool,
                onTap: @escaping () -> Void) {
        self.subtitle = subtitle
        self.badge = badge
        self.isSelected = isSelected
        self.onTap = onTap

        self.content = MaisonKitImage(source: image).frame(width: 60, height: 60)
    }

    /// Creates a new `FormTypeImage` with the given parameters
    /// - Parameters:
    ///   - color: a color to use for the content of the form field
    ///   - subtitle: Optional. The subtitle to display on the bottom of the form type
    ///   - badge: optional. a badge to show next to the title
    ///   - isSelected: whether the field is in selected mode or not.
    ///   - onTap: a closure to invoke when this field is tapped
    public init(color: Color,
                subtitle: String? = nil,
                badge: String? = nil,
                isSelected: Bool,
                onTap: @escaping () -> Void) {
        self.subtitle = subtitle
        self.badge = badge
        self.isSelected = isSelected
        self.onTap = onTap

        self.content = color.frame(width: 60, height: 60)
    }

    /// Creates a new `FormTypeImage` with the given parameters
    /// - Parameters:
    ///   - colorHex: a hex value (without the pound (#) symbol) to use to create a color for display on the form field
    ///   - subtitle: Optional. The subtitle to display on the bottom of the form type
    ///   - badge: optional. a badge to show next to the title
    ///   - isSelected: whether the field is in selected mode or not.
    ///   - onTap: a closure to invoke when this field is tapped
    public init(colorHex: String,
                subtitle: String? = nil,
                badge: String? = nil,
                isSelected: Bool,
                onTap: @escaping () -> Void) {
        self.subtitle = subtitle
        self.badge = badge
        self.isSelected = isSelected
        self.onTap = onTap

        self.content = Color(hex: colorHex).frame(width: 60, height: 60)
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-image",
                                                            variant: FormTypeState.state(isEnabled: self.isEnabled, isSelected: self.isSelected))) {
            VStack {
                Button {
                    self.onTap()
                } label: {
                    self.content.unredacted().eraseToAnyView()
                        .frame(width: 60, height: 60)
                        .style("background")
                }
                .overlay(Color.clear.style("overlay"))
                .overlay(alignment: .topTrailing) {
                    MaisonKitImage(source: .styledImage(identifier: "icon-select"))
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                }

                if self.subtitle != nil || self.badge != nil {
                    StylableGroup("info") {
                        HStack(spacing: 2) {
                            if let subtitle {
                                Text(subtitle)
                                    .style("title")
                            }

                            if let badge {
                                Badge(value: badge)
                            }
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct FormTypeImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack {
                FormTypeImage(title: "ET", subtitle: "Value", badge: "(0)", isSelected: false, onTap: { })
                FormTypeImage(title: "ET", subtitle: "Value (0)", isSelected: true, onTap: { })
                FormTypeImage(title: "ET", subtitle: "Value (0)", isSelected: false, onTap: { })
                    .disabled(true)
            }.previewDisplayName("Text")
            HStack {
                FormTypeImage(color: .red, isSelected: false, onTap: { })
                FormTypeImage(color: .red, isSelected: true, onTap: { })
            }.previewDisplayName("Color")
            HStack {
                FormTypeImage(image: .system(name: "star"), isSelected: false, onTap: { })
                FormTypeImage(image: .system(name: "star"), isSelected: true, onTap: { })
            }.previewDisplayName("Image")
            HStack {
                FormTypeImage(colorHex: "123456", isSelected: false, onTap: { })
                FormTypeImage(colorHex: "123456", isSelected: true, onTap: { })
            }.previewDisplayName("Hex")
        }
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif // DEBUG
