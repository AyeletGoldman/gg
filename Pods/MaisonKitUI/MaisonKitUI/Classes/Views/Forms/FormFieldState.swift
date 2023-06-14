// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// Form Field States
/// The state of the field determines the style of the content.
public struct FormFieldState: Variant {

    /// A placeholder state; for use when there is no data in the field.
    public static let placeholder: FormFieldState = "placeholder"
    /// A focused state, usually used when the field is in focused mode e.g. entering text in a field
    public static let focused: FormFieldState = "focused"
    /// A disabled state; for use when the field cannot be interacted with
    public static let disabled: FormFieldState = "disabled"
    /// An error state; for use when there has been an error. Usually this means some validation did not pass.
    public static let error: FormFieldState = "error"
    /// A warning state; for use when we should warn the user of a problem that is not a blocker.
    public static let warning: FormFieldState = "warning"
    /// A loading state; for use when we are waiting for data to arrive or be sent.
    public static let loading: FormFieldState = "loading"

    public let rawValue: String

    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
