// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A range of colors to be displayed next to each other to indicate
/// availabilities of different options for a product.
public struct ColorRange: View {

    private enum Constants {
        static let numberOfColorsToDisplay = 5
    }

    private let availableColors: [ColorItem]
    private let numberOfItemsToDisplay: Int
    private let additionalItemsFormat: String

    /// Creates a new `ColorRange`
    /// - Parameters:
    ///   - items: the color items available. These can be any view the user wants, but usually you will have either a `Color` or an image.
    ///   - numberOfItemsToDisplay: the number of items to display before adding text for the rest of the items. Defaults to `nil` which will then
    ///   mean `5` items will be displayed.
    ///   - additionalItemsFormat: The format to use when creating the additional number of items available in the range.
    public init(items: [ColorItem], numberOfItemsToDisplay: Int? = nil, additionalItemsFormat: String) {
        self.availableColors = items
        self.numberOfItemsToDisplay = numberOfItemsToDisplay ?? Constants.numberOfColorsToDisplay
        self.additionalItemsFormat = additionalItemsFormat
    }

    public var body: some View {
        StylableGroup("color") {
            HStack(spacing: 5) {
                ForEach(0..<self.availableColors.prefix(self.numberOfItemsToDisplay).count, id: \.self) { index in
                    StylableGroup("color-item") {
                        self.availableColors[index].makeBody()
                            .frame(width: 16, height: 16)
                            .style("background")
                            .eraseToAnyView()
                    }
                }
                if self.availableColors.count > self.numberOfItemsToDisplay {
                    StylableGroup("info") {
                        Text(String(format: self.additionalItemsFormat,
                                    "\(self.availableColors.count - self.numberOfItemsToDisplay)"))
                            .style("title")
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ColorRange_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColorRange(items: [.color(hex: "ababab")],
                       additionalItemsFormat: "+%@")
            ColorRange(items: [
                .color(hex: "ababab"),
                .color(hex: "ababab"),
                .color(hex: "ababab"),
                .color(hex: "ababab"),
                .color(hex: "ababab")
            ],
                       additionalItemsFormat: "+%@")
            ColorRange(items: [
                .color(hex: "ababab"),
                .color(hex: "ababab"),
                .color(hex: "ababab"),
                .color(hex: "ababab"),
                .color(hex: "ababab"),
                .color(hex: "ababab"),
                .color(hex: "ababab"),
                .color(hex: "ababab")
            ],
                       additionalItemsFormat: "+%@")
        }
        .fixedSize()
        .inAllModes(stylist: .defaultStylist, darkModeStylist: .darkModeStylist)
    }
}
#endif
