// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// Form type states
public struct FormTypeState: Variant {

    /// A selected state, usually used when the field is in selection mode e.g. when an item has been selected from a list
    public static let selected: FormTypeState = "selected"
    /// A disabled state; for use when the field cannot be interacted with
    public static let disabled: FormTypeState = "disabled"

    public let rawValue: String

    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
