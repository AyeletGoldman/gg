// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A format specifier for a given variable
public enum LocalizationValueType: String {
    /// If the variable is an integer
    case integer = "d"
    /// If the variable is a floating-point decimal
    case double = "f"
    /// If the variable is an object (usually a string)
    case object = "@"
}
