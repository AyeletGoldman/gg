// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// The available variants for a `Tag`.
/// Note: variants in the stylist are `String`s so even though these variants are the defaults ones, custom variants can be created.
public struct TagVariant: Variant {

    /// The `highlighted` type variant. Use this to indicate that the `Tag` is in highlighted state.
    public static let highlighted: TagVariant = "highlighted"

    public let rawValue: String

    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
