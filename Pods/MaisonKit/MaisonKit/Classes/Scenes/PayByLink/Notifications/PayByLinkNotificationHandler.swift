// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension InboundItemIdentifier {

    /// The inbound identifier to use when a notification is received that will inform the user that a payment has been made
    static let paymentMadeNotification = InboundItemIdentifier(value: "PaymentLinkPaymentMadeInboundItemIdentifier")
}

/// A handler for the notifications relating to pay by link
public struct PayByLinkNotificationHandler: InboundItemRegistration {

    /// Creates a new `PayByLinkNotificationHandler`
    public init() { }

    /// Attempts to handle an inbound item from pay by link to present a client 360 scene
    /// - Parameters:
    ///   - identifier: the identifier. Must be `.confirmOrderNotification`
    ///   - data: a dictionary containing data to be gathered to aid presentation of the scene
    ///   - onDone: A closure to invoke when the scene that has been returned has finished doing any work it required.
    /// - Returns: a wrapped `ProductDetailsScene` if we were able to parse the identifier and data, `nil` otherwise.
    public func handleInboundItem(identifier: InboundItemIdentifier, data: [String: Any], onDone: @escaping (UIViewController) -> Void) -> RouteDescriptor? {
        guard [InboundItemIdentifier.paymentMadeNotification].contains(identifier) else { return nil }

        guard let transactionId = data["transactionId"] as? String else { return nil }

        return TransactionDetailsRouteDescriptor(transactionId: transactionId, onClose: onDone)
    }
}
