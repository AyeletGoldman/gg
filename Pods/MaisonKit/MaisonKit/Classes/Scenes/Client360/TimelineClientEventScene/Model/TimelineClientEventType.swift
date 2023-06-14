// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// Event type to use in the timeline event item
public struct TimelineClientEventType {
    /// The type ID
    public let id: String
    /// The type localized title
    public let title: String

    /// Creates a new `TimelineClientEventType`
    /// - Parameters:
    ///   - id: The type ID
    ///   - title: The type localized title
    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}
