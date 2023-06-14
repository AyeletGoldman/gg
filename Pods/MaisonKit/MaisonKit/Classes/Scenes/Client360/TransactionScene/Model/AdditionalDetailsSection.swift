// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A representation of a section in an order context. These sections usually have a title and some fields
/// to indicate different properties of an order like shipping address, payment information, or customer details.
public struct AdditionalDetailsSection {

    /// Optional. The title for the section. This title will have a prominent display above the fields,
    /// and usually has a separator below it.
    public let title: String?

    /// The fields that will be shown in this section. Fields have a title and a subtitle minimum, but may also
    /// allow navigation or perform other actions when tapped.
    public let fields: [OrderSectionField]

    /// Creates a new `AdditionalDetailsSection`.
    /// - Parameters:
    ///   - title: Optional. The title for the section.
    ///   This title will have a prominent display above the fields, and usually has a separator below it.
    ///   - fields: The fields that will be shown in this section.
    ///   Fields have a title and a subtitle minimum, but may also allow navigation or perform other actions when tapped.
    public init(title: String? = nil, fields: [OrderSectionField]) {
        self.title = title
        self.fields = fields
    }
}

public extension AdditionalDetailsSection {

    private enum Labels {
        static let paymentInformationTitle = MKLocalizedString("client360.transactions.additional-details.payment-information.title",
                                                               comment: "The title for the payment information section in a transaction details screen")
        static let clientInformationTitle = MKLocalizedString("client360.transactions.additional-details.client-information.title",
                                                              comment: "The title for the client information section in a transaction details screen")
    }

    /// A convenience initializer for an `AdditionalDetailsSection` used for a payment information section.
    /// Use this initializer if you want to populate some payment information items in an order, to take advantage of localization in MaisonKit.
    /// - Parameter fields: The fields that will be shown in this section.
    ///   Fields have a title and a subtitle minimum, but may also allow navigation or perform other actions when tapped.
    /// - Returns: A fully initialized `AdditioanlDetailsSection` whose title is defined by the translation key
    /// `client360.transactions.additional-details.payment-information.title`.
    static func paymentInformation(fields: [OrderSectionField]) -> AdditionalDetailsSection {
        return AdditionalDetailsSection(title: Labels.paymentInformationTitle, fields: fields)
    }

    /// A convenience initializer for an `AdditionalDetailsSection` used for a client information section.
    /// Use this initializer if you want to populate some client information items in an order, to take advantage of localization in MaisonKit.
    /// - Parameter fields: The fields that will be shown in this section.
    ///   Fields have a title and a subtitle minimum, but may also allow navigation or perform other actions when tapped.
    /// - Returns: A fully initialized `AdditioanlDetailsSection` whose title is defined by the translation key
    /// `client360.transactions.additional-details.client-information.title`.
    static func clientInformation(fields: [OrderSectionField]) -> AdditionalDetailsSection {
        return AdditionalDetailsSection(title: Labels.clientInformationTitle, fields: fields)
    }
}
