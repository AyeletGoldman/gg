// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A set of data to reference payments made in a transaction, usually from a source like pay-by-link.
public struct TransactionPaymentInformation {

    /// The payment status, this will usually be something like "Pending", "Paid", "Cancelled" or "Expired".
    public let status: String

    /// The ID of the payment, this is usually an ID for the third party that processed the payment.
    public let paymentId: String

    /// The link to the payment. This is useful if the payment is not yet completed and the CA wants to remind the user about the payment.
    /// This value will usually be made copyable in the UI.
    public let paymentLink: URL

    /// Creates a new `TransactionPaymentInformation`.
    /// - Parameters:
    ///   - status: The payment status, this will usually be something like "Pending", "Paid", "Cancelled" or "Expired".
    ///   - paymentId: The ID of the payment, this is usually an ID for the third party that processed the payment.
    ///   - paymentLink: The link to the payment. This is useful if the payment is not yet completed and the CA wants to remind the user about the payment.
    ///   This value will usually be made copyable in the UI.
    public init(status: String, paymentId: String, paymentLink: URL) {
        self.status = status
        self.paymentId = paymentId
        self.paymentLink = paymentLink
    }
}
