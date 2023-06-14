// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension TimelineDisplayable {
    /// Model used for holding and displaying events of the same type
    struct Section: Identifiable {

        /// Unique identifier used for layout identification
        public let id: UUID

        /// The name of the section displayed to the user
        public let title: String

        /// List of the timeline items related to the section, populated through parsing and filtering
        public var items: [TimelineDisplayable.Entry]

        /// Creates a new Section to be used in the timeline part in Client360 screen
        /// - Parameters:
        ///   - id: The unique identifier of the section
        ///   - title: The name of the section displayed to the user
        ///   - items: List of the timeline items related to the section
        public init(id: UUID = UUID(), title: String, items: [TimelineDisplayable.Entry]) {
            self.id = id
            self.title = title
            self.items = items
        }
    }
}

public extension TimelineDisplayable.Section {

    /// Creates a new Section to be used in the timeline part in Client360 screen
    /// - Parameters:
    ///   - id: The unique identifier of the section
    ///   - title: The name of the section displayed to the user
    ///   - items: List of the timeline items related to the section
    init(id: UUID = UUID(), title: String, items: [TimelineItemDisplayable]) {
        self.id = id
        self.title = title
        self.items = items.map { TimelineDisplayable.Entry(item: $0) }
    }
}
