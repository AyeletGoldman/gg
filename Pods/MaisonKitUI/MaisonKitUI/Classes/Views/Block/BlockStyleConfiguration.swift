// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// The configuration for a given `Block` view's style.
/// This configuration object holds the views that are available for any given `BlockStyle` to work with.
public struct BlockStyleConfiguration {

    /// The title shown in the block
    public struct Title: View {
        private let text: String

        /// Creates a new `Title` view with the given text. This `String` is then
        /// inserted into a `Text` view and styled with `title`.
        /// - Parameter text: The string to show as a title
        public init(text: String) {
            self.text = text
        }

        public var body: some View {
            return Text(self.text)
                .style("title")
        }
    }

    /// The subtitle shown in the block
    public struct Subtitle: View {
        private let text: String

        /// Creates a new `Subtitle` view with the given text. This `String` is then
        /// inserted into a `Text` view and styled with `subtitle`.
        /// - Parameter text: The string to show as a subtitle
        public init(text: String) {
            self.text = text
        }

        public var body: some View {
            return Text(self.text)
                .style("subtitle")
        }
    }

    /// The icon shown in the block
    public struct Icon: View {
        private let identifier: StylistIdentifier

        /// Creates a new `Icon` for the block. The icon is based on the identifier passed in by creating a `MaisonKitImage`.
        /// The icon is not constrained to any size here, it should be done in the style.
        /// - Parameter identifier: the identifier to load the icon with
        public init(identifier: StylistIdentifier) {
            self.identifier = identifier
        }

        public var body: some View {
            return MaisonKitImage(source: .styledImage(identifier: self.identifier))
        }
    }

    /// A description of the badge view item.
    public private(set) var title: BlockStyleConfiguration.Title?

    /// A description of the badge view item.
    public private(set) var subtitle: BlockStyleConfiguration.Subtitle?

    /// A symbolic representation of the badge view item.
    public private(set) var icon: BlockStyleConfiguration.Icon?
}
