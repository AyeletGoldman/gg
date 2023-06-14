// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// Represents each of the variables that can be found in a localization format
public struct LocalizationVariable {
    /// The key for the variable
    public let key: String
    /// The type of the value, usually an integer or a string
    public let valueType: LocalizationValueType
    /// The format if the value is 0
    public let zero: String?
    /// The format if the value is 1
    public let one: String?
    /// The format if the value is 2
    public let two: String?
    /// The format if the value is "few"
    public let few: String?
    /// The format if the value is "many"
    public let many: String?
    /// The format if the value is "other"
    public let other: String

    public init(key: String, valueType: LocalizationValueType, zero: String?, one: String?, two: String?, few: String?, many: String?, other: String) {
        self.key = key
        self.valueType = valueType
        self.zero = zero
        self.one = one
        self.two = two
        self.few = few
        self.many = many
        self.other = other
    }}
