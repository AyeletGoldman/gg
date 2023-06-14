// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the presentation of the transaction details screen.
public struct TransactionDetailsRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "TransactionDetailsRouteDescriptor"

    /// The ID of the transaction we want to present the details for
    public let transactionId: String

    /// A closure to call when this descriptor has been presented modally and the user taps the "close" button.
    public let onClose: ((UIViewController) -> Void)?

    /// Creates a new `TransactionDetailsRouteDescriptor`
    /// - Parameters:
    ///   - transactionId: The ID of the transaction we want to present the details for
    ///   - onClose: A closure to call when this descriptor has been presented modally and the user taps the "close" button.
    public init(transactionId: String, onClose: ((UIViewController) -> Void)? = nil) {
        self.transactionId = transactionId
        self.onClose = onClose
    }
}
