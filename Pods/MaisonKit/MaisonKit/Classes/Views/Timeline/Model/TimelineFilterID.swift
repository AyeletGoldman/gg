// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A unique representation of a filter for timeline items
public struct TimelineFilterID: Equatable, Hashable {

    /// Identifier for this filter
    public let value: String

    /// Creates a new `TimelineFilterID` instance
    /// - Parameter value: Identifier for this filter
    public init(value: String) {
        self.value = value
    }
}

extension TimelineFilterID: ExpressibleByStringLiteral {

    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}
