// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The source of an NPS survey. These are events that trigger the survey being sent to the user.
public struct NPSEventSource: ExpressibleByStringLiteral {
    /// The value to display for this event source. This should be a translated string.
    public let displayableValue: String

    /// Creates a new `NPSEventSource` with the given `displayableValue`.
    /// - Parameter displayableValue: The value to display for this event source. This should be a translated string.
    public init(displayableValue: String) {
        self.displayableValue = displayableValue
    }

    public init(stringLiteral value: StringLiteralType) {
        self.displayableValue = value
    }
}

public extension NPSEventSource {
    /// An `NPSEventSource` provided by MaisonKit for an event that sourced after an in-store payment
    static let inStorePayment: NPSEventSource = NPSEventSource(
        displayableValue: MKLocalizedString("nps.event-source.in-store-payment.title",
                                            comment: "The title for an NPS that originated after an in-store payment"))
    // swiftlint:disable line_length
    /// An `NPSEventSource` provided by MaisonKit for an event that sourced after an e-commerce payment
    static let postWebPayment: NPSEventSource = NPSEventSource(
        displayableValue: MKLocalizedString("nps.event-source.post-web-payment.title",
                                            comment: "The title for an NPS that originated after an e-commerce payment. This is, in a screen that shows NPS (Net-Promoter-Score) this label indicates that the survey was answered 'after (post) the payment of the e-commerce order'. This is *not* an action to 'publish' a web delivery."))
    /// An `NPSEventSource` provided by MaisonKit for an event that sourced after an e-commerce delivery
    static let postWebDelivery: NPSEventSource = NPSEventSource(
        displayableValue: MKLocalizedString("nps.event-source.post-web-delivery.title",
                                            comment: "The title for an NPS that originated after an e-commerce delivery. This is, in a screen that shows NPS (Net-Promoter-Score) this label indicates that the survey was answered 'after (post) the delivery of the e-commerce order'. This is *not* an action to 'publish' a web delivery."))
    // swiftlint:enable line_length
}
