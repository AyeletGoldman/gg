// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A typealias used to represent the different states of availability
public struct AvailabilityVariant: ExpressibleByStringLiteral, RawRepresentable {

    enum Context {
        case identifier(String)
        case color(hex: String)
    }

    let context: Context

    /// The raw value for the variant. This is either the stylist identifier or a hex value for the color.
    public var rawValue: String {
        switch self.context {
        case .color(let identifier), .identifier(let identifier):
            return identifier
        }
    }

    /// Creates a new `AvailabilityVariant` with a given raw value
    /// - Parameter rawValue: a string (either a hex value for a color or a stylist identifier)
    public init?(rawValue: String) {
        self.init(rawValue)
    }

    /// Creates a new `AvailabilityVariant` with a string literal
    /// - Parameter value: a string (either a hex value for a color or a stylist identifier)
    public init(stringLiteral value: String) {
        self.init(value)
    }

    /// Creates a new `AvailabilityVariant` with a string
    /// - Parameter value: a string (either a hex value for a color or a stylist identifier)
    public init(_ value: String) {
        if value.starts(with: "#") {
            self.context = .color(hex: value)
        } else {
            self.context = .identifier(value)
        }
    }
}

public extension AvailabilityVariant {
    /// A convenience variant for available stock
    static let inStock: AvailabilityVariant = "available"
    /// A convenience variant for out-of-stock stock
    static let outOfStock: AvailabilityVariant = "out-of-stock"
    /// A convenience variant for stock that is "on-demand"
    static let onDemand: AvailabilityVariant = "on-demand"
}

/// An object used to model the availability of a product
public struct ProductAvailability {
    /// The text used to represent the availability. This will usually be styled as `title`.
    public let displayName: String
    /// The current state of the stock. This will usually be used to style the view using it.
    public let stockLevelVariant: AvailabilityVariant

    /// Create a new ProductAvailability with the given display name and stock level
    /// - Parameters:
    ///   - displayName: The text used to represent the availability. This will usually be styled as `title`.
    ///   - stockLevelVariant: The current state of the stock. This will usually be used to style the view using it. Defaults to `.inStock`.
    public init(displayName: String, stockLevelVariant: AvailabilityVariant = .inStock) {
        self.displayName = displayName
        self.stockLevelVariant = stockLevelVariant
    }
}
