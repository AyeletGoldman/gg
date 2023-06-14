// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A style that can be applied to any BadgeView to customise the way the badge is displayed
public protocol BadgeViewStyle {
    /// The configuration that has the views that are available for placing and styling within a `BadgeView`.
    typealias Configuration = BadgeViewStyleConfiguration
    /// The view that will be returned after configuring and placing all `BadgeView` components.
    associatedtype Body: View

    /// Creates the body of the `BadgeView` for each of the particular implementations of `BadgeViewStyle`.
    /// Use the `configuration` parameter passed in to get access to the (optional) image and title in the `BadgeView`.
    /// - Parameter configuration: the `BadgeViewStyleConfiguration` to retrieve the properties of the badge from
    /// - Returns: a new view, configured and styled.
    func makeBody(configuration: Self.Configuration) -> Self.Body
}

/// The configuration for a given badge view's style.
/// This configuration object holds the views that are available for any given `BadgeViewStyle` to work with.
public struct BadgeViewStyleConfiguration {

    /// The title shown in a badge view
    public struct Title: View {
        private let text: String
        private let identifier: StylistIdentifier

        init(text: String, identifier: StylistIdentifier = "title") {
            self.text = text
            self.identifier = identifier
        }

        public var body: some View {
            return Text(self.text)
                .style(self.identifier)
        }
    }

    /// The color shown in a badge view
    public struct Icon: View {
        private let identifier: StylistIdentifier

        init(identifier: StylistIdentifier) {
            self.identifier = identifier
        }

        public var body: some View {
            return MaisonKitImage(source: .styledImage(identifier: self.identifier))
        }
    }

    /// A description of the badge view item.
    public private(set) var title: BadgeViewStyleConfiguration.Title?

    /// A symbolic representation of the badge view item.
    public private(set) var icon: BadgeViewStyleConfiguration.Icon?
}

public extension BadgeView {

    /// Sets the style for any `BadgeView` in the hierarchy to the given `BadgeViewStyle`.
    /// - Parameter style: a `BadgeViewStyle` to use to configure this `BadgeView`.
    /// - Returns: a new view, with the environment configured for the new badge view.
    func badgeViewStyle<S: BadgeViewStyle>(_ style: S) -> some View {
        self.environment(\.badgeStyle, AnyBadgeViewStyle(style: style))
    }
}
