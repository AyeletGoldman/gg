// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// An identifier for an inbound item e.g. the identifier for a notification or a core spotlight
public struct InboundItemIdentifier: Equatable {

    /// The value of the identifier
    public let value: String

    /// Creates a new `InboundItemIdentifier` with the given value
    /// - Parameter value: the value of the identifier
    public init(value: String) {
        self.value = value
    }
}

extension InboundItemIdentifier: ExpressibleByStringLiteral {

    /// Creates a new `InboundItemIdentifier` from a string literal
    /// - Parameter value: the string to use as a value for the identifier
    public init(stringLiteral value: StringLiteralType) {
        self.init(value: value)
    }
}
