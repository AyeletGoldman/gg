// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The displayable object that controls the data shown in the confirm order scene
public struct ConfirmOrderDisplayable {

    /// The ID of the client who the order is for
    public let clientId: String

    /// The data of the products in the order
    public let productsData: [PayByLinkData.ProductDetails]

    /// Any extra fields of order information
    public let sectionFields: [OrderSectionField]

    /// All data about the pricing of the order
    public let pricingData: [PricingItem]

    /// Creates a new `ConfirmOrderDisplayable` instance
    /// - Parameters:
    ///   - clientId: The ID of the client who the order is for
    ///   - productsData: The data of the products in the order
    ///   - sectionFields: Any extra fields of order information
    ///   - pricingData: All data about the pricing of the order
    public init(clientId: String,
                productsData: [PayByLinkData.ProductDetails],
                sectionFields: [OrderSectionField],
                pricingData: [PricingItem]) {
        self.clientId = clientId
        self.productsData = productsData
        self.sectionFields = sectionFields
        self.pricingData = pricingData
    }
}
