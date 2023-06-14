// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The available variants for a `Banner`.
/// Note: variants in the stylist are `String`s so even though these variants are the defaults ones, custom variants can be created.
public struct BannerVariant: Variant {

    /// The `alert` type variant. Use this to grab the user's attention for errors and alerts.
    public static let alert: BannerVariant = "alert"

    public let rawValue: String

    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
