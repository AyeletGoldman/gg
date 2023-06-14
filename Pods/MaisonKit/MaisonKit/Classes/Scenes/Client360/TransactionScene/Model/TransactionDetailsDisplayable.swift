// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A structure to represent the data that is displayed in the transaction screen
public struct TransactionDetailsDisplayable {

    /// A set of fields to display in the header of the transaction screen
    public let header: Header
    /// Each of the items in the transaction (usually products)
    public let items: [Item]
    /// Any extra fields of order information.
    /// Usually these fields contain line items like discounts, delivery costs, and additional options like purchased warranties.
    public let sectionFields: [OrderSectionField]

    /// A view to display a custom pricing view
    public let pricingDataView: (() -> any View)?

    /// An array of additional information to display at the end of the transaction details screen.
    /// This is a free-form array of information items. Usually you will find notes about the order and delivery and billing addresses here.
    public let additionalDetails: [AdditionalDetailsSection]

    /// Creates a new `TransactionDetailsDisplayable`
    /// - Parameters:
    ///   - header: a set of fields to display in the header of the transaction screen
    ///   - items: each of the items in the transaction (usually products)
    ///   - sectionFields: Any extra fields of order information.
    ///   Usually these fields contain line items like discounts, delivery costs, and additional options like purchased warranties.
    ///   - pricingData: All data about the pricing of the order.
    ///   These items usually include the subtotal, any applicable taxes, discounts and total prices.
    ///   - additionalDetails: An array of additional information to display at the end of the transaction details screen.
    ///   This is a free-form array of information items. Usually you will find notes about the order and delivery and billing addresses here.
    public init(header: Header,
                items: [Item],
                sectionFields: [OrderSectionField] = [],
                pricingData: [PricingItem] = [],
                additionalDetails: [AdditionalDetailsSection] = []) {
        self.items = items
        self.header = header
        self.sectionFields = sectionFields
        self.additionalDetails = additionalDetails
        self.pricingDataView = !pricingData.isEmpty ? { PricingBreakdownView(items: pricingData) } : nil
    }
    /// Creates a new `TransactionDetailsDisplayable`
    /// - Parameters:
    ///   - header: a set of fields to display in the header of the transaction screen
    ///   - items: each of the items in the transaction (usually products)
    ///   - sectionFields: Any extra fields of order information.
    ///   Usually these fields contain line items like discounts, delivery costs, and additional options like purchased warranties.
    ///   These items usually include the subtotal, any applicable taxes, discounts and total prices.
    ///   - additionalDetails: An array of additional information to display at the end of the transaction details screen.
    ///   This is a free-form array of information items. Usually you will find notes about the order and delivery and billing addresses here.
    ///   - pricingDataView: a closure that returns a `View` to display the pricing data.
    public init(header: Header,
                items: [Item],
                sectionFields: [OrderSectionField] = [],
                additionalDetails: [AdditionalDetailsSection] = [],
                pricingDataView: @escaping () -> any View) {
        self.items = items
        self.header = header
        self.sectionFields = sectionFields
        self.additionalDetails = additionalDetails
        self.pricingDataView = pricingDataView
    }
}

public extension TransactionDetailsDisplayable {

    /// A structure to represent the data that is displayed in the header of a transaction screen
    struct Header {

        /// The headline to be displayed in the transaction header. This is usually the date of the transaction.
        public let headline: TypedField?
        /// The title to be displayed in the transaction header. This is usually the price of the transaction.
        public let title: TypedField?
        /// Optional. The number of products that are in the transaction. This should include all products in the transaction even ones that are duplicate.
        /// For example if a transaction has 2 tshirts and 1 trouser, the expected `quantity` would be 3.
        public let quantity: Int?
        /// The status of the transaction. This is usually represented with a string and a small coloured dot that represents the status.
        /// For the visual representation, see `BadgeView`.
        public let status: TransactionStatus?
        /// The transaction reference to present with a copy option.
        public let transactionReference: String?
        /// An array of additional information items that will be displayed below the rest of the header.
        /// Use this field to add custom data you want to show about the order.
        /// The most common use cases would be to show the CA that made the transaction and the store at which the transaction happened.
        public let additionalInformation: [TypedField]

        /// Creates a new `TransactionDetailsDisplayable.Header` instance.
        /// - Parameters:
        ///   - headline: Optional. The headline to be displayed in the transaction header. This is usually the date of the transaction.
        ///   - title: Optional. The title to be displayed in the transaction header. This is usually the price of the transaction.
        ///   - quantity: Optional. The number of products that are in the transaction. This should include all products in the transaction even ones that are duplicate.
        ///   For example if a transaction has 2 tshirts and 1 trouser, the expected `quantity` would be 3.
        ///   - status: Optional. The status of the transaction. This is usually represented with a string and a small coloured dot that represents the status.
        ///   For the visual representation, see `BadgeView`.
        ///   - transactionReference: Optional. The transaction reference to present with a copy option.
        ///   - additionalInformation: An array of additional information items that will be displayed below the rest of the header.
        ///   Use this field to add custom data you want to show about the order.
        ///   The most common use cases would be to show the CA that made the transaction and the store at which the transaction happened.
        public init(headline: TypedField?,
                    title: TypedField?,
                    quantity: Int?,
                    status: TransactionStatus?,
                    transactionReference: String? = nil,
                    additionalInformation: [TypedField] = []) {
            self.headline = headline
            self.title = title
            self.quantity = quantity
            self.status = status
            self.transactionReference = transactionReference
            self.additionalInformation = additionalInformation
        }
    }
}

public extension TransactionDetailsDisplayable.Header {
    /// Creates a new `TransactionDetailsDisplayable.Header` instance with the default configuration options.
    /// - Parameters:
    ///   - date: The date in which the transaction took place, or the date in which the transaction was last updated.
    ///   This date will be formatted in the default format of: Month, Date, Year e.g. "February 25, 2022". Or the equivalent localised version.
    ///   - totalPrice: The total price of this transaction.
    ///   This value will be formatted as a currency and displayed with the corresponding localisation for the user's device.
    ///   - location: The location string to be displayed in the transaction header. This is usually where the transaction took place e.g. a store address
    ///   - advisorName: The name of the advisor to be displayed in the transaction header.
    ///   - quantity: The number of products that are in the transaction. This should include all products in the transaction even ones that are duplicate.
    ///   For example if a transaction has 2 tshirts and 1 trouser, the expected `quantity` would be 3.
    ///   - status: The status of the transaction. This is usually represented with a string and a small coloured dot that represents the status.
    ///   For the visual representation, see `BadgeView`.
    ///   - transactionReference: Optional. The transaction reference to present with a copy option.
    init(date: Date,
         totalPrice: CurrencyConvertable,
         location: String,
         advisorName: String,
         quantity: Int,
         status: TransactionStatus,
         transactionReference: String? = nil) {
        self.headline = TypedField(value: .datetime(date, nil))
        self.title = TypedField(value: .currency(totalPrice, nil))
        self.additionalInformation = [
            location.isEmpty ? nil : TypedField(value: .text(lines: [location]), icon: "icon-location"),
            advisorName.isEmpty ? nil : TypedField(value: .text(lines: [advisorName]), icon: "icon-associate")
        ].compactMap { $0 }
        self.quantity = quantity
        self.status = status
        self.transactionReference = transactionReference
    }
}

public extension TransactionDetailsDisplayable {

    /// A structure to represent the data that is displayed for the items in the transaction.
    struct Item {
        /// The ID of the item (usually a product ID).
        public let id: String
        /// The headline to display in the item row. This is usually the product category.
        public let headline: String?
        /// The title to display in the item row. This is usually the product name.
        public let title: String?
        /// A tag to display in the item row. This is usually the product price.
        public let tag: String?
        /// A set of specifications to display in the item row. These are additional information items that are shown about the product.
        public let specifications: [LabeledValue]
        /// The product's SKU
        public let sku: String?
        /// A URL for the product's image.
        public let imageURL: URL?

        /// Creates a new `TransactionDetailsDisplayable.Item` instance
        /// - Parameters:
        ///   - id: The ID of the item (usually a product ID).
        ///   - headline: The headline to display in the item row. This is usually the product category.
        ///   - title: The title to display in the item row. This is usually the product name.
        ///   - tag: A tag to display in the item row. This is usually the product price.
        ///   - specifications: A set of specifications to display in the item row. These are additional information items that are shown about the product.
        ///   - sku: The product's SKU
        ///   - imageURL: A URL for the product's image.
        public init(id: String,
                    headline: String? = nil,
                    title: String? = nil,
                    tag: String? = nil,
                    specifications: [LabeledValue] = [],
                    sku: String? = nil,
                    imageURL: URL? = nil) {
            self.id = id
            self.specifications = specifications
            self.title = title
            self.tag = tag
            self.headline = headline
            self.sku = sku
            self.imageURL = imageURL
        }
    }
}
