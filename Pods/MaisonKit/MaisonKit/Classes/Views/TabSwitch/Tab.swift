// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// The representation of a single tab in a `TabSwitch`.
struct Tab: Identifiable {

    /// The stable identity of the entity associated with this instance.
    let id: String
    /// The title to display for this tab. This should be localized.
    let title: String
    /// An optional badge to display for the tab. It is displayed in the trailing edge of the tab.
    let badge: String?

    /// Creates a new `Tab`
    /// - Parameters:
    ///   - id: The stable identity of the entity associated with this instance.
    ///   - title: The title to display for this tab. This should be localized.
    ///   - badge: An optional badge to display for the tab. It is displayed in the trailing edge of the tab.
    init(id: String, title: String, badge: String?) {
        self.id = id
        self.title = title
        self.badge = badge
    }
}
