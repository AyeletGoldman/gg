// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The status of a pay by link outreach, including text and a stylist variant to show color in the badge
public struct TransactionStatus {
    let text: String
    let variant: String?

    /// Creates a new `TimelinePayByLinkStatus`
    /// - Parameters:
    ///   - text: the text to display in the pay by link status
    ///   - variant: a variant to apply to the badge to configure its appearance
    public init(text: String, variant: String?) {
        self.text = text
        self.variant = variant
    }
}

public extension TransactionStatus {

    private enum Labels {
        static let pendingTransactionStatus = MKLocalizedString("client360.timeline.transaction.status.pending.title",
                                                                comment: "The title of the pending status in pay by link timeline item")
        static let expiredTransactionStatus = MKLocalizedString("client360.timeline.transaction.status.expired.title",
                                                                comment: "The title of the expired status in pay by link timeline item")
        static let paidTransactionStatus = MKLocalizedString("client360.timeline.transaction.status.paid.title",
                                                             comment: "The title of the paid status in pay by link timeline item")
        static let unknownTransactionStatus = MKLocalizedString("client360.timeline.transaction.status.unknown.title",
                                                                comment: "The title of the unknown status in pay by link timeline item")
    }

    /// The pending status for a pay by link
    static let pending = TransactionStatus(text: Labels.pendingTransactionStatus,
                                           variant: "pending")
    /// The expired status for a pay by link
    static let expired = TransactionStatus(text: Labels.expiredTransactionStatus,
                                           variant: "expired")
    /// The paid status for a pay by link
    static let paid = TransactionStatus(text: Labels.paidTransactionStatus,
                                        variant: "paid")
    /// The unknown status for a pay by link
    static let unknown = TransactionStatus(text: Labels.unknownTransactionStatus,
                                           variant: "unknown")
}

public extension TimelineItemDisplayable {

    private enum Labels {
        static let payByLinkTimelineItemTitle = MKLocalizedString("client360.timeline.pay-by-link.title",
                                                                  comment: "The default title to show on the timeline item for an pay by link outreach")
        static let payByLinkItemsFormat = MKLocalizedString("client360.timeline.pay-by-link.number-of-items.format",
                                                            comment: "The format to use for the number of items in an order. The placeholder is the number of items.")
    }

    /// Creates a new `TimelineItemDisplayable` with the context of a pay by link outreach
    /// - Parameters:
    ///   - payByLinkId: the ID of the outreach. This is used if you want to present a details screen after tapping on this timeline item.
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: The date this timeline event occurred at.
    ///   - totalAmount: the total amount of the transaction that the pay by link represents.
    ///   - numberOfItems: the number of items in this order
    ///   - advisorName: the name of the advisor that sent the pay by link outreach
    ///   - status: the status of the pay by link
    ///   - storeName: the name of the store the advisor that sent the pay by link is associated with
    ///   - productImages: an array of images that should be displayed in the timeline item
    ///   - requireConfirmation: Whether to show the option to confirm or deny this timeline item.
    /// - Returns: a fully initialized `Item` configured for pay by link
    static func payByLinkItem(id payByLinkId: String,
                              filterId: TimelineFilterID = .outreach,
                              date: Date,
                              totalAmount: CurrencyConvertable,
                              numberOfItems: Int,
                              advisorName: String,
                              status: TransactionStatus = .unknown,
                              storeName: String? = nil,
                              productImages: [ImageSource] = [],
                              requireConfirmation: Bool = false) -> Self {
        return TimelineItemDisplayable(id: payByLinkId,
                                       filterId: filterId,
                                       date: date,
                                       title: Labels.payByLinkTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(for: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       tag: status.text, // TODO: Fix to send also variant when designs are updated
                                       mediaItems: productImages.map { .image(source: $0) },
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [String(format: Labels.payByLinkItemsFormat, numberOfItems)]), icon: "icon-cart"),
                                        TypedField(value: .currency(totalAmount))
                                       ].compactMap { $0 }),
                                       requireConfirmation: requireConfirmation)
    }
}
