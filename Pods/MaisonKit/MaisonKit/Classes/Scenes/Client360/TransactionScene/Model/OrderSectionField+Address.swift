// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import Contacts

public extension OrderSectionField {

    private static let addressFormatter: CNPostalAddressFormatter = {
        return CNPostalAddressFormatter()
    }()

    /// Creates a new details section from a given postal address.
    /// - Parameters:
    ///   - subtitle: The subtitle for this section, usually will be something like "Billing address" or "Delivery address".
    ///   - address: The address object to build the fields with. The address will be formatted with a default `CNPostalAddressFormatter`.
    init(subtitle: String, address: CNPostalAddress) {
        let address = OrderSectionField.addressFormatter
            .string(from: address)
        self.title = address.isEmpty ? Localization.Strings.notAvailable : address
        self.subtitle = subtitle
        self.onTap = nil
        self.tag = nil
        self.footer = nil
    }
}

public extension OrderSectionField {

    private enum Labels {
        static let billingAddressTitle = MKLocalizedString("client360.transactions.address-section.billing.title",
                                                           comment: "The title for the line item for billing address")
        static let shippingAddressTitle = MKLocalizedString("client360.transactions.address-section.shipping.title",
                                                           comment: "The title for the line item for shipping address")
    }

    /// A convenience initializer for an `OrderSectionField` used for a billing address field.
    /// Use this initializer if you want to create a billing address field in an order, to take advantage of localization in MaisonKit.
    /// - Parameter address: The address object to build the fields with. The address will be formatted with a default `CNPostalAddressFormatter`.
    /// - Returns: A fully initialized `OrderSectionField` whose title is defined by the translation key
    /// `client360.transactions.address-section.billing.title`.
    static func billingAddress(address: CNPostalAddress) -> OrderSectionField {
        return self.init(subtitle: Labels.billingAddressTitle, address: address)
    }

    /// A convenience initializer for an `OrderSectionField` used for a shipping address field.
    /// Use this initializer if you want to create a shipping address field in an order, to take advantage of localization in MaisonKit.
    /// - Parameter address: The address object to build the fields with. The address will be formatted with a default `CNPostalAddressFormatter`.
    /// - Returns: A fully initialized `OrderSectionField` whose title is defined by the translation key
    /// `client360.transactions.address-section.shipping.title`.
    static func shippingAddress(address: CNPostalAddress) -> OrderSectionField {
        return self.init(subtitle: Labels.shippingAddressTitle, address: address)
    }
}
