// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A label usually used to as a tag to categorize customers, show pricing etc.
public struct BadgeView: View {

    enum Constants {
        static let badgeHeight: CGFloat = 16
    }

    @Environment(\.badgeStyle) private var style

    private let title: String?
    private let icon: StylistIdentifier?

    /// Creates a new `BadgeView` instance
    /// - Parameters:
    ///   - title: the title to display on this badge
    ///   - icon: the `StylistIdentifier` to use to fetch the image for this badge
    public init(title: String? = nil, icon: StylistIdentifier? = nil) {
        self.title = title
        self.icon = icon
    }

    public var body: some View {
        self.style.makeBody(configuration: AnyBadgeViewStyle.Configuration(title: self.title.map {  AnyBadgeViewStyle.Configuration.Title(text: $0) },
                                                                           icon: self.icon.map {  AnyBadgeViewStyle.Configuration.Icon(identifier: $0) }))
    }
}
