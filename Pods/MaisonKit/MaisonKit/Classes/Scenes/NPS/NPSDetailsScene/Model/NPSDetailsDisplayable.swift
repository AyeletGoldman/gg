// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// The details of an NPS survey entry
public struct NPSDetailsDisplayable {
    /// The name of the client that responded to the survey
    public let clientName: String
    /// The source of this NPS. There are pre-defined categories that can be used, and are translated by MaisonKit. Or you can create your own.
    /// MaisonKit ships with: `.inStorePayment`, `.postWebPayment`, `.postWebDelivery`.
    public let source: NPSEventSource
    /// Optional. The ID of the client that responded to the survey. If this is provided, there will be a link between the NPS screen and the client's profile.
    public let clientID: String?
    /// Optional. A summary of the NPS survey. This is usually shown as a free-text comment that the client enters in the NPS survey.
    public let summary: String?
    /// The score given to this NPS. This also includes the maximum score and the variant to control the colour of the progress view.
    public let score: NPSScore
    /// Optional. If there is a transaction associated with this NPS, include the transaction here. The transaction will then be displayed below the summary.
    public let transactionDetails: TimelineItemDisplayable?

    /// Create a new `NPSDetailsDisplayable`.
    /// - Parameters:
    ///   - clientName: The name of the client that responded to the survey
    ///   - source: The source of this NPS. There are pre-defined categories that can be used, and are translated by MaisonKit. Or you can create your own.
    ///   MaisonKit ships with: `.inStorePayment`, `.postWebPayment`, `.postWebDelivery`.
    ///   - clientID: Optional. The ID of the client that responded to the survey. If this is provided, there will be a link between the NPS screen and the client's profile.
    ///   - summary: Optional. A summary of the NPS survey. This is usually shown as a free-text comment that the client enters in the NPS survey.
    ///   - score: The score given to this NPS. This also includes the maximum score and the variant to control the colour of the progress view.
    ///   - transactionDetails: Optional. If there is a transaction associated with this NPS, include the transaction here.
    ///   The transaction will then be displayed below the summary.
    public init(clientName: String,
                source: NPSEventSource,
                clientID: String?,
                summary: String?,
                score: NPSScore,
                transactionDetails: TimelineItemDisplayable?) {
        self.clientName = clientName
        self.source = source
        self.clientID = clientID
        self.summary = summary
        self.score = score
        self.transactionDetails = transactionDetails
    }
}
