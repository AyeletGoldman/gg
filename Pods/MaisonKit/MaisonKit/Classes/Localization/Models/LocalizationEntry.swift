// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// An entry in a `.stringsdict` file.
public struct LocalizationEntry {
    /// The unique key that defines this entry
    public let key: String
    /// The format for the localization. This is a localized string with placeholders.
    public let format: String
    /// Any number of variables that need replaced in the format.
    public let variables: [LocalizationVariable]

    /// Creates a new `LocalizationEntry`
    /// - Parameters:
    ///   - key: The unique key that defines this entry
    ///   - format: The format for the localization. This is a localized string with placeholders.
    ///   - variables: Any number of variables that need replaced in the format.
    public init(key: String, format: String, variables: [LocalizationVariable]) {
        self.key = key
        self.format = format
        self.variables = variables
    }
}
