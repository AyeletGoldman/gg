// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

public extension StylistIdentifier {
    /// Build full stylist identifier
    /// - Parameters:
    ///   - identifier: the basic stylist identifier
    ///   - variant: an optional string to use as the variant in the identifier
    /// - Returns: The full identifier as a string with the given variant, if available
    static func buildFullIdentifier(for identifier: String, variant: String?) -> String {
        guard let variant = variant else {
            return identifier
        }
        return "\(identifier)[\(variant)]"
    }

    /// Build full stylist identifier
    /// - Parameters:
    ///   - identifier: the basic stylist identifier
    ///   - variant: an optional string to use as the variant in the identifier
    /// - Returns: The full identifier as a string with the given variant, if available
    static func buildFullIdentifier(for identifier: StylistIdentifier, variant: String?) -> String {
        return self.buildFullIdentifier(for: identifier.description, variant: variant)
    }

    /// Build full stylist identifier
    /// - Parameters:
    ///   - identifier: the basic stylist identifier
    ///   - variant: an optional string to use as the variant in the identifier
    /// - Returns: The fully-build identifier with the given variant, if available
    static func buildFullIdentifier(for identifier: String, variant: String?) -> StylistIdentifier {
        return StylistIdentifier(self.buildFullIdentifier(for: identifier, variant: variant))
    }

    /// Build full stylist identifier
    /// - Parameters:
    ///   - identifier: the basic stylist identifier
    ///   - variant: an optional string to use as the variant in the identifier
    /// - Returns: The fully-build identifier with the given variant, if available
    static func buildFullIdentifier(for identifier: StylistIdentifier, variant: String?) -> StylistIdentifier {
        return StylistIdentifier(self.buildFullIdentifier(for: identifier.description, variant: variant))
    }
}
