// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

struct TitleStatView: View {

    var text: String

    var body: some View {
        Text(verbatim: self.text)
            .style("title")
            .fixedSize(horizontal: false, vertical: true)
            .lineLimit(2)
            .frame(minHeight: 29, alignment: .top)
    }
}

struct BodyStatView: View {

    var text: String

    var body: some View {
        Text(verbatim: self.text)
            .style("body")
            .minimumScaleFactor(0.8)
    }
}

struct SubtitleStatView: View {
    var text: String

    var body: some View {
        Text(verbatim: self.text)
            .style("subtitle")
            .minimumScaleFactor(0.8)
    }
}

struct TitleValueAndSubtitleStatView: View {

    struct Data {
        let title: String
        let value: String
        let subtitle: String?
    }

    let data: Data

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleStatView(text: self.data.title)
            HStack(alignment: .lastTextBaseline) {
                BodyStatView(text: self.data.value)
                if let subtitle = self.data.subtitle {
                    SubtitleStatView(text: subtitle)
                }
            }
        }
    }
}

/// A ViewModifier for a stat view.
public struct StatViewModifier: ViewModifier {

    // An enum to determine which style identifier to use.
    public enum VariantType: String {
        case circle = "circle-wide"
        case circle2 = "circle2-wide"
        case circle3 = "circle3-wide"
        case barSmall = "bar-small"
    }

    /// The variant that will define the final stylist identifier that will wrap the modified view.
    public let variant: VariantType?

    /// Creates a new `StatViewModifier`.
    /// - Parameter variant: The variant that will define the final stylist identifier that will wrap the modified view.
    public init(variant: VariantType? = nil) {
        self.variant = variant
    }

    private func getStyleName() -> String {
        let variantString = self.variant?.rawValue
        return StylistIdentifier.buildFullIdentifier(for: "block-stats", variant: variantString)
    }

    public func body(content: Content) -> some View {
        StylableGroup(self.getStyleName()) {
            VStack(alignment: .leading, spacing: 0) {
                content
                    .lineLimit(1)
                Spacer()
                    .frame(minHeight: 10) // instad of padding bottom
                    .layoutPriority(2)
            }
            .padding(.top, 10)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity)
            .style("background")
        }
    }
}

public extension View {
    /// Adds padding, a stylist group (and background styles) with the given variant and spacing to the modified view.
    /// - Parameter variant: Optional. One of the available variant types for a stat view. Defaults to `nil`.
    /// - Returns: A modified `View` that has been wrapped in a `StylableGroup` and embedded in a `VStack`.
    func wrappedInStatView(variant: StatViewModifier.VariantType? = nil) -> some View {
        self.modifier(StatViewModifier(variant: variant))
    }
}

struct TitleValueAndSubtitleStatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TitleValueAndSubtitleStatView(data: .init(title: "OUTREACH SALES",
                                                      value: "24.568€",
                                                      subtitle: nil))
            TitleValueAndSubtitleStatView(data: .init(title: "Title",
                                                      value: "16",
                                                      subtitle: "of 34 people of 34 people"))
        }.previewLayout(.fixed(width: 164, height: 96))
        .environmentObject(Stylist.unstyled)
    }
}
