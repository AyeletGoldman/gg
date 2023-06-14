// Copyright © 2023 LVMH. All rights reserved.

import Foundation

public extension ClientListDisplayable {
    /// A representation of a client list to be displayed in summary, or condensed, situations.
    struct SummaryDisplayable {
        /// The list's ID
        public let id: ListID
        /// The title for this list
        public let title: String
        /// The subtitle to be displayed for this list, if any
        public let subtitle: String?
        /// The tag to be displayed for this list, if any
        public let tag: String?
        /// The background image to display on this list's view, if there is the possibility of showing a background.
        public let backgroundImage: ImageSource?

        /// Creates a new `SummaryClientListDisplayable` with the given properties
        /// - Parameter id: the list's ID
        /// - Parameter title: the list's title.
        /// - Parameter subtitle: optional. A subtitle to show with the list, sometimes the number of clients on this list.
        /// - Parameter tag: optional. A tag to show with this list. Can be used to draw the user's attention to this list.
        /// - Parameter backgroundImage: optional. If the background should be an image pass in an image source here.
        /// If this is `nil` the background will be the color of the theme.
        public init(id: ListID,
                    title: String,
                    subtitle: String?,
                    tag: String?,
                    backgroundImage: ImageSource?) {
            self.id = id
            self.title = title
            self.subtitle = subtitle
            self.tag = tag
            self.backgroundImage = backgroundImage
        }
    }
}
