//
//  PricingData.swift
//  Kenzo Clienteling
//
//  Created by ba-link on 09/03/2023.
//

import Foundation
import MaisonKit

public extension Array where Element == PricingItem {

    private enum Labels {
        static let subtotalTitle = MKLocalizedString("client360.transactions.pricing.subtotal.title",
                                                     comment: "The title of the subtotal line item in the transaction details pricing section")
        static let taxesTitle = MKLocalizedString("client360.transactions.pricing.taxes.title",
                                                  comment: "The title of the taxes line item in the transaction details pricing section")
        static let dutiesTitle = MKLocalizedString("client360.timeline.transactions.duties.title",
                                                  comment: "The title of the taxes line item in the transaction details pricing section")
        static let totalTitle = MKLocalizedString("client360.transactions.pricing.total.title",
                                                  comment: "The title of the total line item in the transaction details pricing section")
    }

    /// A convenience initializer for arrays of `PricingItem` objects.
    /// Usually, the pricing items will display subtotal, taxes and total. Use this convenience method to take advantage of localization from MaisonKit.
    /// - Parameters:
    ///   - subtotal: the string to use as a subtotal value. This value should include currency code and be localised to the user's display.
    ///   - taxes: the string to use as a taxes value. This value should include currency code and be localised to the user's display.
    ///   - total: the string to use as a total value. This value should include currency code and be localised to the user's display.
    /// - Returns: An array of `PricingItem`s in `subtotal -> taxes -> total` order, with titles localised by MaisonKit.
    static func items(subtotal: String, taxes: String, duties: String, total: String) -> [PricingItem] {
        return [
            PricingItem(title: Labels.subtotalTitle,
                        subtitle: subtotal),
            PricingItem(title: Labels.taxesTitle,
                        subtitle: taxes),
            PricingItem(title: Labels.dutiesTitle,
                        subtitle: duties),
            PricingItem(title: Labels.totalTitle,
                        subtitle: total,
                        isHighlighted: true)
        ]
    }

    /// A convenience initializer for arrays of `PricingItem` objects.
    /// Usually, the pricing items will display subtotal, taxes and total. Use this convenience method to take advantage of localization from MaisonKit.
    /// - Parameters:
    ///   - subtotal: the pricing data to use as a subtotal value. This value will be formatted according to the user's preferences before being displayed.
    ///   - taxes: the pricing data to use as a taxes value. This value will be formatted according to the user's preferences before being displayed.
    ///   - total: the pricing data to use as a total value. This value will be formatted according to the user's preferences before being displayed.
    /// - Returns: An array of `PricingItem`s in `subtotal -> taxes -> total` order, with titles localised by MaisonKit.
    static func items(subtotal: CurrencyConvertable,
                      taxes: CurrencyConvertable,
                      duties: CurrencyConvertable,
                      total: CurrencyConvertable) -> [PricingItem] {
        self.items(subtotal: subtotal.toString(), taxes: taxes.toString(),duties: duties.toString(), total: total.toString())
    }
}
