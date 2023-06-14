// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension TimelineItemDisplayable {

    internal enum TransactionLabels {
        static let transactionTimelineItemTitle = MKLocalizedString("client360.timeline.transaction.title",
                                                                    comment: "The default title to show on the timeline item for a transaction")
    }

    private enum Labels {
        static let inStoreTransactionItemTypeTile = MKLocalizedString("client360.timeline.transaction.in-store.title",
                                                                      comment: "The subtitle for the transaction event type that is in store")
        static let payByLinkTransactionItemTypeTile = MKLocalizedString("client360.timeline.transaction.payByLink.title",
                                                                        comment: "The subtitle for the transaction event type that is a pay by link")
        static let virtualTransactionFooterText = MKLocalizedString("client360.timeline.transaction.virtual.footer.title",
                                                                    comment: "The text to show when a transaction was made online")
    }

    /// Creates a new `TimelineItemDisplayable` with all the parameters for an instore transaction item
    /// - Parameters:
    ///   - transactionId: the ID of the transaction. Used if we need to request extra details to present them in a new scene.
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date the transaction occurred.
    ///   - totalAmount: the total amount of the transaction, with currency.
    ///   - advisorName: the name of the advisor that made the sale
    ///   - storeName: the store name of the advisor that made the sale
    ///   - productImages: an array of product images to display
    ///   - shouldPresentDetailsPage: whether the timeline item should present inner details page on select
    /// - Returns: a fully initialized `Item`.
    static func inStoreTransactionItem(id transactionId: String,
                                       filterId: TimelineFilterID = .transaction,
                                       date: Date,
                                       totalAmount: CurrencyConvertable,
                                       advisorName: String,
                                       storeName: String? = nil,
                                       productImages: [ImageSource] = [],
                                       shouldPresentDetailsPage: Bool = true) -> Self {
        let action: ActionType? = shouldPresentDetailsPage ? .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return TransactionDetailsRouteDescriptor(transactionId: transactionId)
        }) : nil
        return TimelineItemDisplayable(id: transactionId,
                                       filterId: filterId,
                                       date: date,
                                       title: TransactionLabels.transactionTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(from: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       mediaItems: productImages.map { .image(source: $0) },
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [Labels.inStoreTransactionItemTypeTile])),
                                        TypedField(value: .currency(totalAmount))
                                       ]),
                                       action: action)
    }

    /// Creates a new `TimelineItemDisplayable` with all the parameters for a virtual transaction item
    /// - Parameters:
    ///   - transactionId: the ID of the transaction. Used if we need to request extra details to present them in a new scene.
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date the transaction occurred.
    ///   - websiteAddress: the address of the online site where the transaction occurred
    ///   - totalAmount: the total amount of the transaction, with currency.
    ///   - productImages: an array of product images to display
    /// - Returns: a fully initialized `Item`.
    static func virtualTransactionItem(id transactionId: String,
                                       filterId: TimelineFilterID = .transaction,
                                       date: Date,
                                       websiteAddress: String,
                                       totalAmount: CurrencyConvertable,
                                       productImages: [ImageSource] = []) -> Self {
        return TimelineItemDisplayable(id: transactionId,
                                       filterId: filterId,
                                       date: date,
                                       title: TransactionLabels.transactionTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(from: date),
                                       footer: Labels.virtualTransactionFooterText,
                                       mediaItems: productImages.map { .image(source: $0) },
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [websiteAddress])),
                                        TypedField(value: .currency(totalAmount))
                                       ]))
    }

    /// Creates a new `TimelineItemDisplayable` with all the parameters for a pay by link transaction item
    /// - Parameters:
    ///   - transactionId: the ID of the transaction. Used if we need to request extra details to present them in a new scene.
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date the transaction occurred.
    ///   - totalAmount: the total amount of the transaction, with currency.
    ///   - advisorName: the name of the advisor that should be attributed this sale. This could be the advisor that sent the original link to the client, for example.
    ///   - storeName: the store name of the advisor that made the sale
    ///   - productImages: an array of product images to display
    /// - Returns: a fully initialized `Item`.
    static func payByLinkTransactionItem(id transactionId: String,
                                         filterId: TimelineFilterID = .transaction,
                                         date: Date,
                                         totalAmount: CurrencyConvertable,
                                         advisorName: String,
                                         storeName: String? = nil,
                                         productImages: [ImageSource] = []) -> Self {
        return TimelineItemDisplayable(id: transactionId,
                                       filterId: filterId,
                                       date: date,
                                       title: TransactionLabels.transactionTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(from: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       mediaItems: productImages.map { .image(source: $0) },
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [Labels.payByLinkTransactionItemTypeTile])),
                                        TypedField(value: .currency(totalAmount))
                                       ]))
    }
}
