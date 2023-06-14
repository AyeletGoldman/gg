// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// The available variants for a `BadgeButton`.
/// Note: variants in the stylist are `String`s so even though these variants are the defaults ones, custom variants can be created.
public struct BadgeButtonVariant: Variant {

    /// The `selected` type variant. Use this to indicate that the `BadgeButton` is in selected state.
    public static let selected: BadgeButtonVariant = "selected"

    public let rawValue: String

    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
