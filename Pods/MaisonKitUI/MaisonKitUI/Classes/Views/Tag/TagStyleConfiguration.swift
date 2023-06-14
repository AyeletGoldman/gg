// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// The configuration for a given `Tag` view's style.
/// This configuration object holds the views that are available for any given `TagStyle` to work with.
public struct TagStyleConfiguration {

    /// The title shown in the tag
    public struct Title: View {
        private let text: String

        /// Creates a new `Title` view with the given text. This `String` is then
        /// inserted into a `Text` view and styled with `title`.
        /// - Parameter text: The string to show as a title
        public init(text: String) {
            self.text = text
        }

        public var body: some View {
            return Text(verbatim: self.text)
                .style("title")
        }
    }

    /// The icon shown in the tag
    public struct Icon: View {
        private let source: ImageSource

        /// Creates a new `Icon` for the tag. The icon is based on the source passed in by creating a `MaisonKitImage`.
        /// The icon is not constrained to any size here, it should be done in the style.
        /// - Parameter source: the source to load the icon with
        public init(source: ImageSource) {
            self.source = source
        }

        public var body: some View {
            return MaisonKitImage(source: self.source)
        }
    }

    /// A description of the tag view item.
    public private(set) var title: TagStyleConfiguration.Title?

    /// A symbolic representation of the badge view item.
    public private(set) var icon: TagStyleConfiguration.Icon?

    /// Defines whether or not to vertically pad the tag
    public let padded: Bool

    /// Optional. A variant to apply to the tag.
    public let variant: TagVariant?
}
