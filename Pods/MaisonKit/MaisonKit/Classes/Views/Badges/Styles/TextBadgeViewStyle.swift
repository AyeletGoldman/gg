// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A style for `BadgeView` that only shows the title with a `tag-primary` stylable group
public struct PrimaryBadgeViewStyle: BadgeViewStyle {

    /// A variant to apply to the badge
    /// The final group will be `tag-primary[variant]` if there is a variant, or `tag-primary` if there is no variant.
    public let variant: String?

    /// The padding to apply to the badge before the background is applied.
    /// This means that the badge will appear to grow (e.g. the whitespace of the padding will be the color of the background for the badge).
    public let verticalPadding: Double

    /// Creates a new `PrimaryBadgeStyle` with the given variant. The variant defaults to `nil`.
    /// - Parameter variant: A variant to apply to the badge's group.
    /// - Parameter verticalPadding: The padding to apply to the badge before the background is applied.
    /// The final group will be `tag-primary[variant]` if there is a variant, or `tag-primary` if there is no variant.
    public init(variant: String? = nil, verticalPadding: Double = 0) {
        self.variant = variant
        self.verticalPadding = verticalPadding
    }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        self.makeTitleBody(groupName: StylistIdentifier.Path(StylistIdentifier.buildFullIdentifier(for: "tag-primary", variant: self.variant)),
                           title: configuration.title,
                           verticalPadding: self.verticalPadding)
    }
}

/// A style for `BadgeView` that only shows the title with a `tag-secondary` stylable group
public struct SecondaryBadgeViewStyle: BadgeViewStyle {

    /// A variant to apply to the badge
    /// The final group will be `tag-secondary[variant]` if there is a variant, or `tag-secondary` if there is no variant.
    public let variant: String?

    /// The padding to apply to the badge before the background is applied.
    /// This means that the badge will appear to grow (e.g. the whitespace of the padding will be the color of the background for the badge).
    public let verticalPadding: Double

    /// Creates a new `SecondaryBadgeViewStyle` with a given vertical padding to apply
    /// - Parameter variant: A variant to apply to the badge's group.
    /// - Parameter verticalPadding: The padding to apply to the badge before the background is applied.
    /// This means that the badge will appear to grow (e.g. the whitespace of the padding will be the color of the background for the badge).
    public init(variant: String? = nil, verticalPadding: Double = 0) {
        self.variant = variant
        self.verticalPadding = verticalPadding
    }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        self.makeTitleBody(groupName: StylistIdentifier.Path(StylistIdentifier.buildFullIdentifier(for: "tag-secondary", variant: self.variant)),
                           title: configuration.title,
                           verticalPadding: self.verticalPadding)
    }
}

private extension BadgeViewStyle {
    @ViewBuilder
    func makeTitleBody(groupName: StylistIdentifier.Path, title: Configuration.Title?, verticalPadding: CGFloat = 0) -> some View {
        StylableGroup(groupName) {
            title
                .padding(.horizontal, 7.5)
                .padding(.vertical, verticalPadding)
                .style("background")
        }
    }
}
