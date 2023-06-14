// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A badge style for a stock availability. Has a small dot with a color representing
/// the availability and a title.
public struct StockBadgeViewStyle: BadgeViewStyle {

    /// The availability variant for this style
    public var variant: AvailabilityVariant?

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "tag-status", variant: self.variant?.stylistVariant)) {
            Label(title: {
                configuration.title
            }, icon: {
                self.variant?.color
                    .frame(width: 9, height: 9)
                    .style("indicator/background")
            }).labelStyle(BadgeLabelStyle())
                .padding(.horizontal, 4.5)
                .padding(.vertical, 2)
                .style("background")
        }
    }
}

private struct BadgeLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 4) {
            configuration.icon
            configuration.title
        }
    }
}
