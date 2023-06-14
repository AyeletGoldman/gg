// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Usually these are displayed as lists of properties in a product list.
/// For example you could use these to show key-value pairs of product attributes like color, material etc.
public struct LabeledValue {

    private enum Labels {
        static let labelFormat = MKLocalizedString("labeled-value.label.format",
                                                   comment: "The format of a labeled value. In English, this will simply be the value passed in with a colon at the end.")
    }

    /// The localized value for the label to display.
    public let label: String

    /// The localized value to display next to the label.
    public let value: String

    /// Creates a new `LabeledValue`
    /// - Parameters:
    ///   - label: The localized value for the label to display.
    ///   - value: The localized value to display next to the label.
    public init(label: String, value: String) {
        self.label = String(format: Labels.labelFormat, label)
        self.value = value
    }
}
