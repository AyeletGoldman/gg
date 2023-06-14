// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// An item in an order, with a quantity.
public struct OrderCreationItem {
    /// The product ID, usually a SKU
    public let productId: String
    /// The number of items of this productID/SKU in the order
    public let quantity: Int
}

/// An adapter for Pay by link, which handles all data required for the pay by link functionality.
public protocol PayByLinkAdapter {

    /// Creates a new order
    /// - Parameters:
    ///   - products: the products in the order. This is usually a SKU, and a quantity.
    ///   - clientId: the client ID that the order is for.
    ///   - deliveryMethodId: the ID of the delivery method.
    /// - Returns: A publisher that, on success, will return a `String` which represents the order ID.
    func createOrder(products: [OrderCreationItem], clientId: String, deliveryMethodId: String) -> AnyPublisher<Result<String, ErrorDisplayable>, Error>

    /// Requests the adapter to retrieve the details for the order with the given order ID.
    /// - Parameter orderId: the ID of the order to get the details for.
    /// - Returns: A publisher that will eventually resolve to either a `ConfirmOrderDisplayable` or an error.
    func retrieveOrder(orderId: String) -> AnyPublisher<Result<ConfirmOrderDisplayable, ErrorDisplayable>, Error>

    /// Requests the adapter to retrieve the payment link for a given order ID.
    /// - Parameter orderId: the ID of the order to get the payment details for.
    /// - Returns: A publisher that will eventually resolve to either a `PaymentLinkDisplayable` or an error.
    func getPaymentLink(orderId: String) -> AnyPublisher<Result<PaymentLinkDisplayable, ErrorDisplayable>, Error>

    /// Retrieves the details for copying a pay-by-link item
    /// - Parameters:
    ///   - linkId: the ID of the link
    ///   - orderId: the order ID
    /// - Returns: A publisher which, on success, will return an array of fields to be displayed in the copy payment user interface
    func getCopyPaymentLinkDetails(linkId: String, orderId: String) -> AnyPublisher<Result<[TypedField], ErrorDisplayable>, Error>

    /// Requests the adapter to cancel the order with the given order ID.
    /// - Parameter orderId: the ID of the order to cancel.
    func cancelOrder(orderId: String)

    /// Requests the adapter to get the templates for a given order ID, client ID and payment link ID.
    /// - Parameters:
    ///   - orderId: the order ID
    ///   - clientId: the ID of the client for which the templates will be loaded
    ///   - linkId: the ID of the link that will be sent to the user
    /// - Returns: A publisher that will eventually resolve to either a `TemplatesDisplayable` or an error
    func getTemplates(orderId: String, clientId: String, linkId: String) -> AnyPublisher<Result<TemplatesDisplayable, ErrorDisplayable>, Error>

    /// Asks the adapter to retrieve the available channels for a given client ID.
    /// - Parameters:
    ///   - clientID: the client ID whose available channels should be fetched
    ///   - orderID: the order ID
    /// - Returns: a publisher that, on success, will return a result containing either the required `OutreachSelectionDisplayable` or an error.
    func getPayByLinkClientOutreachChannels(clientID: String, orderID: String) -> AnyPublisher<Result<OutreachSelectionDisplayable, ErrorDisplayable>, Error>

    /// Tells the adapter to create an interaction with the given interaction creation data
    /// - Parameters:
    ///   - interaction: the data to use to create an interaction
    ///   - orderId: the ID of the shared order
    /// - Returns: a publisher which will be listened to so as to decide whether to show a success message or an error message.
    func createInteraction(interaction: OutreachInteractionCreation, orderId: String) -> VoidResultPublisher

    /// Requests the pay by link data for the given product IDs
    /// - Parameter productIds: a list of product IDs to get the pay by link data for
    /// - Returns: a publisher that will resolve wth either a new `PayByLinkData` based on the given product IDs or an error
    func getPayByLinkProductData(for productIds: [String]) -> AnyPublisher<Result<PayByLinkData, ErrorDisplayable>, Error>

    /// Requests the product infomation for a specific product in pay by link
    /// - Parameter productOrMasterID: the product ID to fetch the product information for
    /// - Parameter attributes: the dictionary of attribute ID to attribue value that are selected for a product
    /// - Returns: A publisher that will resoilve with either the product information or an error
    func getPBLProductInformation(for productOrMasterID: String, attributes: [ProductAttributeID: String]?) -> AnyPublisher<Result<PBLProductInformationDisplayable, ErrorDisplayable>, Error>
}
