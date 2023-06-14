// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A view that displays pricing information for a transaction
public struct PricingBreakdownView: View {

    /// Determines how to align text of the pricing items and the info.
    public enum AlignmentOption {
        /// Alignment: title, price, spacer.
        case leading
        /// Alignment: spacer, title, price.
        case trailing
        /// Alignment: title, spacer, price.
        case center
    }

    private let items: [PricingItem]
    private let alignmentOption: AlignmentOption

    /// Creates a `PricingBreakdownView`.
    /// - Parameters:
    ///   - items: The pricing items of the transaction, such as amount, tax and total.
    ///   - alignmentOption: Used to determine how to align the view.
    public init(items: [PricingItem], alignmentOption: AlignmentOption = .trailing) {
        self.items = items
        self.alignmentOption = alignmentOption
    }

    public var body: some View {
        StylableGroup("totals") {
            self.buildContent()
                .padding(.vertical)
                .addStyledRowDivider()
        }
    }

    private func buildInfoView() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(0..<self.items.count, id: \.self) { index in
                // Yes, title/subtitle are the opposite between style and data
                StylableGroup(StylistIdentifier.buildFullIdentifier(for: "info",
                                                                    variant: self.getVariantForItem(at: index))) {
                    Text(verbatim: "\(self.items[index].title):")
                        .style("subtitle")
                        .alignmentGuide(.leading, computeValue: { dimension in
                            dimension[.leading]
                        })
                }
            }
        }
    }

    private func buildPricingView() -> some View {
        VStack(alignment: .trailing, spacing: 10) {
            ForEach(0..<self.items.count, id: \.self) { index in
                StylableGroup(StylistIdentifier.buildFullIdentifier(for: "info",
                                                                    variant: self.getVariantForItem(at: index))) {
                    Text(verbatim: self.items[index].subtitle).style("title")
                }
            }
        }
    }

    private func buildContent() -> some View {
        HStack {
            switch self.alignmentOption {
            case .leading:
                self.buildInfoView()
                self.buildPricingView()
                Spacer()
            case .center:
                self.buildInfoView()
                Spacer()
                self.buildPricingView()
            case .trailing:
                Spacer()
                self.buildInfoView()
                self.buildPricingView()
            }
        }
    }

    private func getVariantForItem(at index: Int) -> String {
        return self.items[index].isHighlighted ? "label-highlighted" : "label"
    }
}
