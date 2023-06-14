// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension TimelineDisplayable {
    /// Model used for holding and displaying a filter related to the client timeline
    struct Filter: Identifiable, Hashable {

        /// The identifier for this filter. When this filter is selected, items with this filter ID will be kept, others filtered out.
        public let id: TimelineFilterID

        /// The name of the filter displayed to the user
        public let name: String

        /// Creates a new Filter to be used in the timeline part in Client360 screen
        /// - Parameters:
        ///   - id: The identifier for this filter. When this filter is selected, items with this filter ID will be kept, others filtered out.
        ///   - name: The name of the filter displayed to the user
        public init(id: TimelineFilterID, name: String) {
            self.id = id
            self.name = name
        }
    }
}
