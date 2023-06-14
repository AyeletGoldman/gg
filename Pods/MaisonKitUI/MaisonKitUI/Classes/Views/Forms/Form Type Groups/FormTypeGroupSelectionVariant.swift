// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// A variant for form-type-group
public struct FormTypeGroupSelectionVariant: Variant {

    /// A variant for multi-selection groups
    public static let multi: FormTypeGroupSelectionVariant = "multi"

    public let rawValue: String

    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
