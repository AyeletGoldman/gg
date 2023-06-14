// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A small image type, ideal for colour or size options. Supports, short text (max 3 chars recommended), color & images
public struct FormTypeSmallImage: View {

    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.indicatorContentType) private var indicatorContentType

    private let isSelected: Bool
    private let onTap: () -> Void
    private let content: any View

    /// Creates a new `FormFieldSmallImage` with the given parameters
    /// - Parameters:
    ///   - title: The title to display in the middle of the field. This is usually just a few letters (< 5). If you have long titles
    ///   - isSelected: whether the field is in selected mode or not.
    ///   - onTap: a closure to invoke when this field is tapped
    public init(title: String, isSelected: Bool, onTap: @escaping () -> Void) {
        self.isSelected = isSelected
        self.onTap = onTap
        self.content = Text(title)
            .lineLimit(1)
            .truncationMode(.tail)
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .frame(minWidth: 40)
            .style("title")
    }

    /// Creates a new `FormFieldSmallImage` with the given parameters
    /// - Parameters:
    ///   - image: an image to use for the content of the form field
    ///   - isSelected: whether the field is in selected mode or not.
    ///   - isLoading: whether the field is loading or not.
    ///   - onTap: a closure to invoke when this field is tapped
    public init(image: ImageSource, isSelected: Bool, onTap: @escaping () -> Void) {
        self.isSelected = isSelected
        self.onTap = onTap
        self.content = MaisonKitImage(source: image).frame(width: 40, height: 40)
    }

    /// Creates a new `FormFieldSmallImage` with the given parameters
    /// - Parameters:
    ///   - color: a color to use for the content of the form field
    ///   - isSelected: whether the field is in selected mode or not.
    ///   - isLoading: whether the field is loading or not.
    ///   - onTap: a closure to invoke when this field is tapped
    public init(color: Color, isSelected: Bool, onTap: @escaping () -> Void) {
        self.isSelected = isSelected
        self.onTap = onTap
        self.content = color.frame(width: 40, height: 40)
    }

    /// Creates a new `FormFieldSmallImage` with the given parameters
    /// - Parameters:
    ///   - colorHex: a hex value (without the pound (#) symbol) to use to create a color for display on the form field
    ///   - isSelected: whether the field is in selected mode or not.
    ///   - isLoading: whether the field is loading or not.
    ///   - onTap: a closure to invoke when this field is tapped
    public init(colorHex: String, isSelected: Bool, onTap: @escaping () -> Void) {
        self.isSelected = isSelected
        self.onTap = onTap
        self.content = Color(hex: colorHex).frame(width: 40, height: 40)
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "form-type-image-sm",
                                                            variant: FormTypeState.state(isEnabled: self.isEnabled, isSelected: self.isSelected))) {
            Button {
                self.onTap()
            } label: {
                self.content.unredacted().eraseToAnyView()
                    .overlay(Color.clear.style("overlay"))
                    .overlay(alignment: .bottomTrailing) {
                        if let indicatorContentType {
                            Indicator(contentType: indicatorContentType)
                        }
                    }
                    .style("background")
            }
        }
    }
}

#if DEBUG
struct FormFieldSmallImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                FormTypeSmallImage(title: "KM", isSelected: false, onTap: { })
                    .withIndicator(.variant(.available))
                FormTypeSmallImage(title: "KMA", isSelected: true, onTap: { })
                FormTypeSmallImage(title: "KMER", isSelected: false, onTap: { })
            }
            HStack {
                FormTypeSmallImage(color: .red, isSelected: false, onTap: { })
                    .withIndicator(.variant(.available))
                FormTypeSmallImage(color: .red, isSelected: true, onTap: { })
            }
            HStack {
                FormTypeSmallImage(image: .system(name: "star"), isSelected: false, onTap: { })
                    .withIndicator(.variant(.available))
                FormTypeSmallImage(image: .system(name: "star"), isSelected: true, onTap: { })
            }
            HStack {
                FormTypeSmallImage(colorHex: "123456", isSelected: false, onTap: { })
                    .withIndicator(.variant(.available))
                FormTypeSmallImage(colorHex: "123456", isSelected: true, onTap: { })
            }
        }
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
