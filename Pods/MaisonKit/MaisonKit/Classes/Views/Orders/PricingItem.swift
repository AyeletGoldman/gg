// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// An abstraction of a field used for each pricing item. For example, subtotal, tax and total fields in an order.
/// If a field is highlighted, the UI will account for that and apply a highlighted state, which is context dependent.
public struct PricingItem {

    /// The title of the item, for example "Subtotal". This should be localized.
    public let title: String

    /// The subtitle of the item, this will usually be a price. This should be localized.
    public let subtitle: String

    /// Whether or not this item is highlighted.
    /// If an item is highlighted, the UI will apply a highlighted state, which is context dependent.
    public let isHighlighted: Bool

    /// Creates a new `PricingItem` instance.
    /// - Parameters:
    ///   - title: The title of the item, for example "Subtotal". This should be localized.
    ///   - subtitle: The subtitle of the item, this will usually be a price. This should be localized.
    ///   - isHighlighted: Whether or not this item is highlighted.
    public init(title: String, subtitle: String, isHighlighted: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.isHighlighted = isHighlighted
    }
}

public extension PricingItem {

    /// Creates a new `PricingItem` instance.
    /// - Parameters:
    ///   - title: The title of the item, for example "Subtotal". This should be localized.
    ///   - value: The value of the item, as a `CurrencyConvertable` type. This will be localized by MaisonKit.
    ///   - isHighlighted: Whether or not this item is highlighted.
    init(title: String, value: CurrencyConvertable, isHighlighted: Bool = false) {
        self.title = title
        self.subtitle = value.toString()
        self.isHighlighted = isHighlighted
    }
}
