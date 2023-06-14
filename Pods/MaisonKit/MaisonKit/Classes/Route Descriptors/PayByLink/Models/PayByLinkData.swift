// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The data required to create a pay by link interaction.
/// This data is used to create an order.
public struct PayByLinkData {

    /// The products that will be displayed in the pay by link scene, that will be included in the order created via pay by link.
    public var products: [ProductDetails]

    /// The set of available delivery methods available and selected for this particular pay by link order.
    public let deliveryMethods: DeliveryMethods

    /// Creates a new `PayByLinkData` instance.
    /// - Parameters:
    ///   - products: The products that will be displayed in the pay by link scene, that will be included in the order created via pay by link.
    ///   - deliveryMethods: The set of available delivery methods available and selected for this particular pay by link order.
    public init(products: [ProductDetails], deliveryMethods: DeliveryMethods) {
        self.products = products
        self.deliveryMethods = deliveryMethods
    }
}

extension PayByLinkData {

    /// A set of product details for PayByLink
    public struct ProductDetails {

        /// The ID of this product. Can hold the sku or another identifier, depends on implementation.
        /// Must be unique.
        public let id: String
        /// Holds the master ID for this product, if it exists.
        /// This property controls whether or not the user will be allowed to edit the properties of the product in PBL
        public let productMasterId: String?
        /// The product's name.
        public let name: String
        /// The product's category (usually only the last-level)
        public let category: String
        /// The product image. Usually it also corresponds to what you would expect to see as the "hero" image in the product details screen.
        public let image: ImageSource
        /// A set of attributes for the product like the color, or material it is made from.
        public let attributes: ProductAttributes
        /// The quantity of this product
        public var quantity: Int
        /// The combined price of items (individual price x quantity)
        public let price: String?

        /// Creates a new `PayByLinkData.ProductDetails`
        /// - Parameters:
        ///   - id: The ID of this product. Can hold the sku or another identifier, depends on implementation.
        ///   - productMasterId: The ID of this product. Holds the master ID for this product, if it exists.
        ///   This property controls whether or not the user will be allowed to edit the properties of the product in PBL
        ///   - name: The product's name.
        ///   - image: The product image. Usually it also corresponds to what you would expect to see as the "hero" image in the product details screen.
        ///   - category: The product's category (usually only the last-level)
        ///   - attributes: A set of attributes for the product like the color, or material it is made from.
        ///   - quantity: The quantity of this product
        ///   - price: The combined price of items (individual price x quantity)
        public init(id: String,
                    productMasterId: String?,
                    name: String,
                    image: ImageSource,
                    category: String,
                    attributes: ProductAttributes,
                    quantity: Int,
                    price: String?) {
            self.id = id
            self.productMasterId = productMasterId
            self.name = name
            self.category = category
            self.image = image
            self.attributes = attributes
            self.quantity = quantity
            self.price = price
        }

        /// Creates a new `PayByLinkData.ProductDetails`
        /// - Parameters:
        ///   - id: The ID of this product. Can hold the sku or another identifier, depends on implementation.
        ///   - productMasterId: The ID of this product. Holds the master ID for this product, if it exists.
        ///   This property controls whether or not the user will be allowed to edit the properties of the product in PBL
        ///   - name: The product's name.
        ///   - image: The product image. Usually it also corresponds to what you would expect to see as the "hero" image in the product details screen.
        ///   - category: The product's category (usually only the last-level)
        ///   - attributes: A set of attributes for the product like the color, or material it is made from.
        ///   - quantity: The quantity of this product
        ///   - price: The combined price of items (individual price x quantity)
        public init(id: String,
                    productMasterId: String?,
                    name: String,
                    image: ImageSource,
                    category: String,
                    attributes: ProductAttributes,
                    quantity: Int,
                    price: CurrencyConvertable) {
            self.id = id
            self.productMasterId = productMasterId
            self.name = name
            self.category = category
            self.image = image
            self.attributes = attributes
            self.quantity = quantity
            self.price = price.toString()
        }
    }
}

extension PayByLinkData.ProductDetails: Identifiable { }

extension PayByLinkData.ProductDetails: Hashable {
    public static func == (lhs: PayByLinkData.ProductDetails, rhs: PayByLinkData.ProductDetails) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

/// Holds the available and selected delivery methods for an order
public struct DeliveryMethods {

    /// A list of available delivery methods
    public let availableMethods: [SelectionListItem]

    /// The selected delivery method, usually the selected delivery method is whatever the default is, not the one selected by the client.
    public let selectedMethod: SelectionListItem?

    /// Creates a new `DeliveryMethods` instance.
    /// - Parameters:
    ///   - availableMethods: A list of available delivery methods
    ///   - selectedMethod: The selected delivery method, usually the selected delivery method is whatever the default is, not the one selected by the client.
    public init(availableMethods: [SelectionListItem], selectedMethod: SelectionListItem? = nil) {
        self.availableMethods = availableMethods
        self.selectedMethod = selectedMethod
    }
}
