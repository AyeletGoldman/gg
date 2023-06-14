// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// The indicator content type
public enum IndicatorContentType {
    /// Specific color
    case color(Color)
    /// The variant of the stylist group "indicator". the indicator color will be defined by the stylist with the variant
    case variant(IndicatorVariant)
}

/// A variant for `Indicator`
public struct IndicatorVariant: Variant {

    /// A variant for avaliable status
    public static let available: IndicatorVariant = "available"
    /// A variant for on demand status
    public static let onDemand: IndicatorVariant = "on-demand"
    /// A variant for out of stock status
    public static let outOfStock: IndicatorVariant = "out-of-stock"

    public let rawValue: String

    public init(stringLiteral value: StringLiteralType) {
        self.rawValue = value
    }

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
