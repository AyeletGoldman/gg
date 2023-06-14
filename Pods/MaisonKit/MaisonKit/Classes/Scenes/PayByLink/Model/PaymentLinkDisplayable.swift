// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A representation of a payment link to be used to send to the client to pay for their order.
public struct PaymentLinkDisplayable {

    /// The ID of the payment link.
    public let id: String
    /// The URL to be shared with the user. Use this URL to allow the user to pay for their order.
    public let url: URL

    /// Creates a new `PaymentLinkDisplayable` instance.
    /// - Parameters:
    ///   - id: The ID of the payment link.
    ///   - url: The URL to be shared with the user. Use this URL to allow the user to pay for their order.
    public init(id: String, url: URL) {
        self.id = id
        self.url = url
    }
}
