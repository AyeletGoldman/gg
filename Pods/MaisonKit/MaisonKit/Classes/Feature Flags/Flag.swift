// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A value representing the name of a flag, or variant.
/// Used to identify each of the features that we want to enable or disable.
public struct FlagName: RawRepresentable {

    /// The raw value of this feature name.
    public private(set) var rawValue: String

    /// Creates a new `FlagName` with the given `String` as a raw value.
    /// - Parameter rawValue: the string representation of the feature name.
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension FlagName: ExpressibleByStringLiteral {

    /// Creates a new `FlagName` with the given literal as a raw value
    /// - Parameter value: the literal value that this flag will use as a raw value
    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }
}

extension FlagName: Codable { }

extension FlagName: Hashable { }

/// A combination of `FlagName` and a `Bool` indicating whether or not it should be enabled.
public struct Flag {

    /// The name for this flag. This will be used to search when deciding if something is enabled or not.
    public let name: FlagName
    /// The value to set the flag to.
    public let isEnabled: Bool

    /// Creates a new `Flag`.
    /// - Parameters:
    ///   - name: the name for this flag. This will be used to search when deciding if something is enabled or not.
    ///   - isEnabled: the value to set the flag to.
    public init(name: FlagName, isEnabled: Bool) {
        self.name = name
        self.isEnabled = isEnabled
    }
}
