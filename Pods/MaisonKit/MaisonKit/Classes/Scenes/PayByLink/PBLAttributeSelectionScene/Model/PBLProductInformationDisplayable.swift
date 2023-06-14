// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A set of data that defines a product to be displayed in the attribute selection flow in pay by link
public struct PBLProductInformationDisplayable {
    /// The master ID of this product.
    /// Only master products, or products with a master are available for attribute selection
    public let masterId: String
    /// The prouct ID. This should be populated if all attributes selected determine that there is a product inferred from the master.
    public let productId: String?
    /// The name of the product
    public let productName: String
    /// The price of the product. Fully formatted with currency and localised.
    public let price: String?
    /// The attributes that are shown on the list; i.e. the attribute category and the attribute selected for that category
    public let attributes: ProductAttributes?

    /// Creates a new `PBLProductInformationDisplayable`
    /// - Parameters:
    ///   - masterId: The master ID of this product.
    ///   Only master products, or products with a master are available for attribute selection
    ///   - productId: The prouct ID. This should be populated if all attributes selected determine that there is a product inferred from the master.
    ///   - productName: The name of the product
    ///   - price: The price of the product. Fully formatted with currency and localised.
    ///   - attributes: The attributes that are shown on the list; i.e. the attribute category and the attribute selected for that category
    public init(masterId: String,
                productId: String?,
                productName: String,
                price: String?,
                attributes: ProductAttributes?) {
        self.masterId = masterId
        self.productId = productId
        self.productName = productName
        self.price = price
        self.attributes = attributes
    }

    /// Creates a new `PBLProductInformationDisplayable`
    /// - Parameters:
    ///   - masterId: The master ID of this product.
    ///   Only master products, or products with a master are available for attribute selection
    ///   - productId: The prouct ID. This should be populated if all attributes selected determine that there is a product inferred from the master.
    ///   - productName: The name of the product
    ///   - price: The price of the product. Fully formatted with currency and localised by MaisonKit.
    ///   - attributes: The attributes that are shown on the list; i.e. the attribute category and the attribute selected for that category
    public init(masterId: String,
                productId: String?,
                productName: String,
                price: CurrencyConvertable,
                attributes: ProductAttributes?) {
        self.masterId = masterId
        self.productId = productId
        self.productName = productName
        self.price = price.toString()
        self.attributes = attributes
    }
}
