// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import MaisonKit

extension TimelineFilterID {
    static let action = TimelineFilterID(value: "action")
}

extension TimelineDisplayable.Filter {
    
    static let action = Self(id: .action,
                             name: MKLocalizedString("client360.timeline.filters.action.title",
                                                     comment: "Title for the action filter type"))
}

extension TimelineItemDisplayable {
    
    
    static func actionItem(id outreachId: String,
                           filterId: TimelineFilterID = .offlineContact,
                           title: String,
                           date: Date,
                           advisorName: String?,
                           storeName: String?,
                           comment: String? = nil) -> Self {
        
        var action: ActionType?
        var commentPreview = "N/A"
        if let comment = comment, !comment.isEmpty {
            commentPreview = comment
            action = .sceneProvider(sceneFactory: { _ in
                AnyScene(scene: ClientActionDetailsScene(actionTitle: MKLocalizedString(title, comment: "timeline action title"),
                                                         actionContent: comment))
            })
        }

        var attributes: [TypedField] = []
        attributes.append(TypedField(value: .text(lines: [advisorName ?? "N/A"]), icon: iconsByFieldApiName["advisor"]))
        attributes.append(TypedField(value: .text(lines: [storeName ?? "N/A"]), icon: iconsByFieldApiName["store"]))
        attributes.append(TypedField(value: .text(lines: [commentPreview]), icon: "icon-template"))

        return TimelineItemDisplayable(id: outreachId,
                                                  filterId: filterId,
                                                  date: date,
                                                  title: MKLocalizedString(title, comment: "timeline action title"),
                                                  detail: Detail(attributes: attributes),
                                                  action: action)
    }
}


// Supported types are
// - Transaction
// - Interaction
// - Newsletter
extension TimelineItemDisplayable {
    // swiftlint:disable:next function_body_length cyclomatic_complexity
    init?(item: ClientTimelineV2.ClientTimelineV2Timeline) {
        switch item {
        case .timelineInteractionEntry(let interaction):
            switch interaction.metadata {
            case .interactionOutreachActionMetadata(let actionMetadata):
                self = .actionItem(id: interaction.id,
                                   title: actionMetadata.actionTitle,
                                   date: interaction.datetime.value,
                                   advisorName: interaction.advisorName,
                                   storeName: interaction.advisorStore.name,
                                   comment: actionMetadata.subject)
            case .interactionOutreachMetadata(let outreachMetadata):
                self = .outreachItem(id: interaction.id,
                                     date: interaction.datetime.value,
                                     channelName: interaction.channel.rawValue,
                                     advisorName: interaction.advisorName,
                                     storeName: interaction.advisorStore.name,
                                     templateTitle: outreachMetadata.templateName)
            case .interactionPayByLinkMetadata(let payByLinkMetadata):
                self = .payByLinkItem(id: interaction.id,
                                      date: interaction.datetime.value,
                                      totalAmount: CurrencyConvertable(fractionalUnitAmount: payByLinkMetadata.price.value,
                                                                       numberOfFractionalUnitsInMonetaryUnit: payByLinkMetadata.price.divisor,
                                                                       currencyCode: payByLinkMetadata.price.currency),
                                      numberOfItems: payByLinkMetadata.products.count,
                                      advisorName: interaction.advisorName,
                                      status: MaisonKit.TransactionStatus(orderStatus: payByLinkMetadata.orderStatus),
                                      storeName: interaction.advisorStore.name,
                                      productImages: payByLinkMetadata.products.flatMap(\.productImageURLs).map { .url($0) })
            case .interactionPostalMetadata(let metadata):
                if let action = metadata.actionType {
                    self = .offlineAction(id: interaction.id,
                                          date: interaction.datetime.value,
                                          actionType: action,
                                          advisorName: interaction.advisorName,
                                          storeName: interaction.advisorStore.name)
                } else {
                    self = .postalItem(id: interaction.id,
                                       date: interaction.datetime.value,
                                       notes: metadata.note,
                                       advisorName: interaction.advisorName,
                                       storeName: interaction.advisorStore.name)
                }
            case .interactionProductCuratorMetadata(let metadata):
                self = Self.handleCuratorInteraction(interaction, metadata: metadata)
            case .interactionProductShareMetadata(let productShareMetadata):
                self = .productShareItem(id: interaction.id,
                                         date: interaction.datetime.value,
                                         channel: interaction.channel.rawValue,
                                         productName: productShareMetadata.product.productName,
                                         advisorName: interaction.advisorName,
                                         storeName: interaction.advisorStore.name,
                                         productImages: productShareMetadata.product.productImageURLs.map { .url($0) })
            case .interactionVirtualConsultationMetadata(let virtualConsultationMetadata):
                self = .consultationItem(id: interaction.id,
                                         date: interaction.datetime.value,
                                         consultationType: .virtual,
                                         timeRange: TimeRange(startTime: virtualConsultationMetadata.startTime.value,
                                                              endTime: virtualConsultationMetadata.endTime.value),
                                         advisorName: interaction.advisorName,
                                         storeName: interaction.advisorStore.name)
            }
        case .timelineNewsletterEntry(let interaction):
            self = .buildNewsletterItem(id: interaction.id,
                                        date: interaction.datetime.value,
                                        details: interaction.subject,
                                        status:interaction.status)
        case .timelineTransactionEntry(let transaction):
            self = .inStoreTransactionItem(id: transaction.id,
                                           title: transaction.title,
                                           type: transaction.type.rawValue,
                                           date: transaction.datetime.value,
                                           totalAmount: CurrencyConvertable(fractionalUnitAmount: transaction.price.value,
                                                                            numberOfFractionalUnitsInMonetaryUnit: transaction.price.divisor,
                                                                            currencyCode: transaction.price.currency),
                                           advisorName: transaction.advisorName ?? "",
                                           storeName: transaction.storeName.isEmpty ? nil : transaction.storeName,
                                           productImages: [],
                                           quantity: transaction.itemCount)
        case .timelineAppointmentEntry(let appointment):
            switch appointment.channel {
            case .call, .video:
                self = .consultationItem(id: appointment.id,
                                         filterId: .consultation,
                                         date: appointment.startTime.value,
                                         consultationType: .virtual,
                                         timeRange: TimeRange(startTime: appointment.startTime.value,
                                                              endTime: appointment.endTime.value),
                                         advisorName: appointment.advisor.name,
                                         storeName: appointment.territory.name)
            case .people:
                self = .consultationItem(id: appointment.id,
                                         filterId: .consultation,
                                         date: appointment.startTime.value,
                                         consultationType: .inStore,
                                         timeRange: TimeRange(startTime: appointment.startTime.value,
                                                              endTime: appointment.endTime.value),
                                         advisorName: appointment.advisor.name,
                                         storeName: appointment.territory.name)
            }
        case .timelineCaseEntry(let caseEntry):
            self = .buildCaseItem(id: caseEntry.id,
                                  date: caseEntry.datetime.value,
                                  details: caseEntry.detailsFields,
                                  status: caseEntry.status,
                                  advisorName: caseEntry.owner.name)
        case .timelineNpsEntry(let nps):
            self = .npsItem(id: nps.id,
                            date: nps.datetime.value,
                            score: NPSScore(value: nps.score.score,
                                            maximumValue: nps.score.maximumValue,
                                            identifierVariant: nps.score.stylistVariant),
                            source: .inStorePayment)
        }
    }
    
    private static func handleCuratorInteraction(_ interaction: TimelineInteractionEntry, metadata: InteractionProductCuratorMetadata) -> TimelineItemDisplayable {
        let assets = metadata.products
            .flatMap { $0.productAssetURLs }
            .compactMap { asset -> MediaType? in
                if asset.contentType.starts(with: "image") {
                    return MediaType.image(source: .url(asset.url))
                }
                if asset.contentType.starts(with: "video") {
                    return MediaType.video(source: .url(asset.url), preview: nil)
                }
                return nil
            }
        return .curationTimelineItem(id: interaction.id,
                                     date: interaction.datetime.value,
                                     channel: interaction.channel.rawValue,
                                     advisorName: interaction.advisorName,
                                     storeName: interaction.advisorStore.name,
                                     curationAssets: assets)
    }
    
    /// Create a `Detail` for `Newsletter` types
    internal static func buildNewsletterItem(id: String,
                                             date: Date,
                                             details: String,
                                             status: String) -> TimelineItemDisplayable {
        let newsletterTimelineItemTitle = MKLocalizedString("client360.timeline.newsletter.title",
                                                            comment: "The default title to show on the timeline item for a given newsletter")
        let newsletterTimelineItemSentBy = MKLocalizedString("client360.timeline.newsletter.sentBy",
                                                             comment: "The default 'sent by' entity to show on the timeline item for a newsletter")
        
        return TimelineItemDisplayable(id: id,
                                       filterId: .newsletter,
                                       date: date,
                                       title: newsletterTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(from: date),
                                       footer: newsletterTimelineItemSentBy,
                                       tag: status,
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: ["\(details)"]) ,icon: "icon-newsletter")
                                       ])
        )
    }
    
    /// Create a `Detail` for `NPS` types
    static func buildNpsItem(id: String,
                             date: Date,
                             score: NpsFeedbackAnswerScore,
                             name: String,
                             advisorName: String,
                             storeName: String? = nil,
                             shouldPresentDetailsPage: Bool = true) -> Self {
        let npsTimelineItemTitle = MKLocalizedString("client360.timeline.nps.title",
                                                      comment: "The default title to show on the timeline item for a given case")
        var action: ActionType?
//        var commentPreview = "N/A"
//        if let comment = comment, !comment.isEmpty {
//            commentPreview = comment
            action = .sceneProvider(sceneFactory: { _ in
                AnyScene(scene: ClientActionDetailsScene(actionTitle: MKLocalizedString("title", comment: "timeline action title"),
                                                         actionContent: "comment"))
            })
//        }
        return TimelineItemDisplayable(id: id,
                                       filterId: .nps,
                                       date: date,
                                       title: npsTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(for: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       tag: "\(score.score)/\(score.maximumValue)",
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: ["\(name)"]))
                                       ]),
                                       action: action
        )
    }

    
    /// Create a `Detail` for `Case` types
    static func buildCaseItem(id: String,
                              date: Date,
                              details: [TypedValue]?,
                              status: String,
                              advisorName: String,
                              storeName: String? = nil) -> Self {
        let caseTimelineItemTitle = MKLocalizedString("client360.timeline.case.title",
                                                      comment: "The default title to show on the timeline item for a given case")
        return TimelineItemDisplayable(id: id,
                                       filterId: .customerService,
                                       date: date,
                                       title: caseTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(for: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       tag: status,
                                       detail: Detail(attributes: details?.map { TypedField(from: $0) } ?? [])
        )
    }

}

extension MaisonKit.TransactionStatus {
    init(orderStatus: TransactionStatus) {
        switch orderStatus {
        case .activated, .draft:
            self = .pending
        case .cancelled:
            self = .expired
        case .paid, .deliveryInProgress, .deliveredToStore, .deliveredToClient:
            self = .paid
        }
    }
}
public extension TimelineItemDisplayable {
    
    enum Labels {
        static let postalEventDetail = MKLocalizedString("client360.timeline.outreach.postal.title",
                                                         comment: "The default title to show on the timeline item for a postal outreach")
        static let transactionTimelineItemTitle = MKLocalizedString("client360.timeline.transaction.title",
                                                                    comment: "The default title to show on the timeline item for a transaction")
        static let inStoreTransactionItemTypeTile = MKLocalizedString("client360.timeline.transaction.in-store.title",
                                                                      comment: "The subtitle for the transaction event type that is in store")
        static let payByLinkTransactionItemTypeTile = MKLocalizedString("client360.timeline.transaction.payByLink.title",
                                                                        comment: "The subtitle for the transaction event type that is a pay by link")
        static let virtualTransactionFooterText = MKLocalizedString("client360.timeline.transaction.virtual.footer.title",
                                                                    comment: "The text to show when a transaction was made online")
        static let quantityString = MKLocalizedString("client360.timeline.transactions.quantity", comment: "the text to describe quantity")
    }
    
    /// Creates a new `TimelineItemDisplayable` instance formatted for a "Offline Contact" outreach item
    /// - Parameters:
    ///   - outreachId: the ID of the outreach. This is so we can get the details if the item is tapped
    ///   - date: the date of this entry.
    ///   - notes: any notes that are available about this postal outreach
    ///   - advisorName: the name of the advisor that made the outreach
    ///   - actionType: the offline action type
    ///   - storeName: optional. The name of the store that the advisor made the outreach from.
    /// - Returns: A fully initialized timeline `Item`
    internal static func offlineAction(id outreachId: String,
                            date: Date,
                            actionType: String,
                            notes: String? = nil,
                            advisorName: String,
                            storeName: String? = nil) -> TimelineItemDisplayable {
        return TimelineItemDisplayable(id: outreachId,
                                       filterId: .offlineContact,
                                       date: date,
                                       title: MKLocalizedString(actionType, comment: "action type"),
                                       subtitle: DateFormatter.timeOnlyFormatter.string(for: date),
                                       footer: storeName.map { String(format: CustomTimeLineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       detail: .empty)
    }
    enum CustomTimeLineLabels {
        // swiftlint:disable line_length
        static let advisorAndStoreFooterFormat = MKLocalizedString("client360.timeline.timeline-item.footer.advisor-and-store.format",
                                                                   comment: "The format to use for the footer in an a timeline item. The first placeholder is the client  advisor's name and the second is the store name.")
        // swiftlint:enable line_length
    }
    
}

extension TimelineFilterID {
    static let offlineContact = TimelineFilterID(value: MKLocalizedString("client360.timeline.filters.offlineContact", comment: "Offline Contact"))
    
    static let customerService = TimelineFilterID(value: MKLocalizedString("client360.timeline.filters.cases", comment: ""))
    
    static let nps = TimelineFilterID(value: MKLocalizedString("client360.timeline.filters.nps", comment: ""))
}

extension TimelineItemDisplayable {
    
    
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
                                       title: String,
                                       type: String,
                                       filterId: TimelineFilterID = .transaction,
                                       date: Date,
                                       totalAmount: CurrencyConvertable,
                                       advisorName: String,
                                       storeName: String? = nil,
                                       productImages: [ImageSource] = [],
                                       quantity: Int,
                                       shouldPresentDetailsPage: Bool = true) -> Self {
        let action: ActionType? = shouldPresentDetailsPage ? .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return TransactionDetailsRouteDescriptor(transactionId: transactionId)
        }) : nil
        return TimelineItemDisplayable(id: transactionId,
                                       filterId: filterId,
                                       date: date,
                                       title: type,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(from: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       mediaItems: productImages.map { .image(source: $0) },
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: ["\(quantity) \(Labels.quantityString)"])),
                                        TypedField(value: .currency(totalAmount)),
                                        TypedField(value: .text(lines: ["\(title)"]))
                                       ]),
                                       action: action)
    }
}

enum TimelineLabels {
    // swiftlint:disable line_length
    static let advisorAndStoreFooterFormat = MKLocalizedString("client360.timeline.timeline-item.footer.advisor-and-store.format",
                                                               comment: "The format to use for the footer in an a timeline item. The first placeholder is the client advisor's name and the second is the store name.")
    // swiftlint:enable line_length
}
                                 
