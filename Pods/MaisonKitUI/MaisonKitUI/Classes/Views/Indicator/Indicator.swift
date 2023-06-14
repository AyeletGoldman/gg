// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A small visual indicator of a state
public struct Indicator: View {

    @Environment(\.isLoading) private var isLoading

    private let contentType: IndicatorContentType

    /// Creates a new `Indicator` instance
    /// - Parameter contentType: The content type to apply to this view.
    public init(contentType: IndicatorContentType) {
        self.contentType = contentType
    }

    public var body: some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(
            for: "indicator",
            variant: self.isLoading ? "no-stock" : self.contentType.variant)) {
                Rectangle()
                    .foregroundColor(self.isLoading ? .clear : (self.contentType.color ?? .clear))
                    .frame(width: 10, height: 10)
                    .shimmer(if: self.isLoading)
                .style("background")
        }
    }
}

private extension IndicatorContentType {
    var color: Color? {
        if case .color(let color) = self {
            return color
        } else {
            return nil
        }
    }

    var variant: IndicatorVariant? {
        if case .variant(let variant) = self {
            return variant
        } else {
            return nil
        }
    }
}

#if DEBUG
struct Indicator_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Indicator(contentType: .variant(.available))
            Indicator(contentType: .color(.purple))
            Indicator(contentType: .variant(.available))
                .loading()
            Indicator(contentType: .color(.purple))
                .loading()
        }
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
