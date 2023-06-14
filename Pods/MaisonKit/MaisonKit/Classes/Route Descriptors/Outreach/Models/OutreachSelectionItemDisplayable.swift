// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The displayable item for an outreach selection entry
/// This object defines what data will be displayed for an entry in the
public struct OutreachSelectionItemDisplayable: Identifiable {

    public let id = UUID()

    /// The icon to display on the leading edge of the row
    /// If no icon is set, there is white space
    public let icon: ImageSource?
    /// The title to show next to the icon
    public let title: String
    /// An optional tag to display next to the title.
    public let tag: String?
    /// A string to display in a dimmed color on the trailing edge of the row
    public let body: String?
    /// An icon to display on the trailing edge.
    /// This is only displayed if the entry item is not a parent type, because the parent's icon overrides this.
    public let trailingIcon: ImageSource?

    /// Creates a new `OutreachSelectionItemDisplayable`
    /// - Parameters:
    ///   - icon: The icon to display on the leading edge of the row
    ///   If no icon is set, there is white space
    ///   - title: The title to show next to the icon
    ///   - tag: An optional tag to display next to the title.
    ///   - body: A string to display in a dimmed color on the trailing edge of the row
    ///   - trailingIcon: An icon to display on the trailing edge.
    ///   This is only displayed if the entry item is not a parent type, because the parent's icon overrides this.
    public init(icon: ImageSource? = nil,
                title: String,
                tag: String? = nil,
                body: String? = nil,
                trailingIcon: ImageSource? = nil) {
        self.icon = icon
        self.title = title
        self.tag = tag
        self.body = body
        self.trailingIcon = trailingIcon
    }
}
