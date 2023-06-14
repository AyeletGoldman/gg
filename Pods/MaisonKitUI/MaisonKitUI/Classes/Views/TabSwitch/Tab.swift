// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// The representation of a single tab in a `TabSwitch`.
public struct Tab: Identifiable {

    /// The stable identity of the entity associated with this instance.
    public let id: String
    /// The title to display for this tab. This should be localized.
    public let title: String
    /// An optional badge to display for the tab. It is displayed in the trailing edge of the tab.
    public let badge: Int?

    /// Creates a new `Tab`
    /// - Parameters:
    ///   - id: The stable identity of the entity associated with this instance.
    ///   - title: The title to display for this tab. This should be localized.
    ///   - badge: An optional badge to display for the tab. It is displayed in the trailing edge of the tab.
    public init(id: String, title: String, badge: Int?) {
        self.id = id
        self.title = title
        self.badge = badge
    }
}
