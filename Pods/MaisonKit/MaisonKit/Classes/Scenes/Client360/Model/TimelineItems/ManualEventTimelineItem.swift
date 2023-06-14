// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension TimelineItemDisplayable {

    // swiftlint:disable function_parameter_count
    /// Creates a new `TimelineItemDisplayable` instance formatted for a manual outreach event item
    /// - Parameters:
    ///   - eventID: the ID of the event. This is so we can get the details if the item is tapped
    ///   - date: the date of this entry.
    ///   - showTime: whether to show the time in the timeline item or not.
    ///   - eventType: the event type this event belong to.
    ///   - attributes: the detail attributes to show in the item after the event type.
    ///   - advisorName: the name of the advisor that created the event
    ///   - storeName: optional. The name of the store that the advisor created the event for.
    ///   - allowEdit: whether to allow to edit this item or not
    ///   - allowDelete: whether to allow to delete this item or not
    /// - Returns: A fully initialized timeline `Item`
    static func outreachEventItem(id eventID: String,
                                  date: Date,
                                  showTime: Bool,
                                  eventType: TimelineClientEventType,
                                  attributes: [TypedField],
                                  advisorName: String,
                                  storeName: String? = nil,
                                  allowEdit: Bool = true,
                                  allowDelete: Bool = true) -> Self {
        let eventTypeAttribute = TypedField(value: .text(lines: [eventType.title]), icon: "icon-app")
        return self.manualEventItem(id: eventID,
                                    filterID: .outreach,
                                    title: OutreachLabels.outreachTimelineItemTitle,
                                    date: date,
                                    showTime: showTime,
                                    eventType: eventType,
                                    attributes: [eventTypeAttribute] + attributes,
                                    advisorName: advisorName,
                                    storeName: storeName,
                                    allowEdit: allowEdit,
                                    allowDelete: allowDelete)
    }
    // swiftlint:enable function_parameter_count

    /// Creates a new `TimelineItemDisplayable` instance formatted for a manual transaction event item
    /// - Parameters:
    ///   - eventID: the ID of the event. This is so we can get the details if the item is tapped
    ///   - date: the date of this entry.
    ///   - showTime: whether to show the time in the timeline item or not.
    ///   - eventType: the event type this event belong to.
    ///   - attributes: the detail attributes to show in the item after the event type.
    ///   - advisorName: the name of the advisor that created the event
    ///   - storeName: optional. The name of the store that the advisor created the event for.
    ///   - allowEdit: whether to allow to edit this item or not
    ///   - allowDelete: whether to allow to delete this item or not
    /// - Returns: A fully initialized timeline `Item`
    // swiftlint:disable:next function_parameter_count
    static func transactionEventItem(id eventID: String,
                                     date: Date,
                                     showTime: Bool,
                                     eventType: TimelineClientEventType,
                                     attributes: [TypedField],
                                     advisorName: String,
                                     storeName: String? = nil,
                                     allowEdit: Bool = true,
                                     allowDelete: Bool = true) -> Self {
        let eventTypeAttribute = TypedField(value: .text(lines: [eventType.title]), icon: "icon-app")
        return self.manualEventItem(id: eventID,
                                    filterID: .transaction,
                                    title: TransactionLabels.transactionTimelineItemTitle,
                                    date: date,
                                    showTime: showTime,
                                    eventType: eventType,
                                    attributes: [eventTypeAttribute] + attributes,
                                    advisorName: advisorName,
                                    storeName: storeName,
                                    allowEdit: allowEdit,
                                    allowDelete: allowDelete)
    }

    /// Creates a new `TimelineItemDisplayable` instance formatted for a manual consultation event item
    /// - Parameters:
    ///   - eventID: the ID of the event. This is so we can get the details if the item is tapped
    ///   - date: the date of this entry.
    ///   - showTime: whether to show the time in the timeline item or not.
    ///   - eventType: the event type this event belong to.
    ///   - attributes: the detail attributes to show in the item after the event type.
    ///   - advisorName: the name of the advisor that created the event
    ///   - storeName: optional. The name of the store that the advisor created the event for.
    ///   - allowEdit: whether to allow to edit this item or not
    ///   - allowDelete: whether to allow to delete this item or not
    /// - Returns: A fully initialized timeline `Item`
    // swiftlint:disable:next function_parameter_count
    static func consultationEventItem(id eventID: String,
                                      date: Date,
                                      showTime: Bool,
                                      eventType: TimelineClientEventType,
                                      attributes: [TypedField],
                                      advisorName: String,
                                      storeName: String? = nil,
                                      allowEdit: Bool = true,
                                      allowDelete: Bool = true) -> Self {
        let eventTypeAttribute = TypedField(value: .text(lines: [eventType.title]), icon: "icon-app")
        return self.manualEventItem(id: eventID,
                                    filterID: .consultation,
                                    title: ConsultationLabels.consultationTimelineItemTitle,
                                    date: date,
                                    showTime: showTime,
                                    eventType: eventType,
                                    attributes: [eventTypeAttribute] + attributes,
                                    advisorName: advisorName,
                                    storeName: storeName,
                                    allowEdit: allowEdit,
                                    allowDelete: allowDelete)
    }

    /// Creates a new `TimelineItemDisplayable` instance formatted for a manual event outreach item
    /// - Parameters:
    ///   - eventID: the ID of the event. This is so we can get the details if the item is tapped
    ///   - filterID: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - title: the event title.
    ///   - date: the date of this entry.
    ///   - showTime: whether to show the time in the timeline item or not.
    ///   - eventType: the event type this event belong to.
    ///   - attributes: the detail attributes to show in the item.
    ///   - advisorName: the name of the advisor that created the event
    ///   - storeName: optional. The name of the store that the advisor created the event for.
    ///   - allowEdit: whether to allow to edit this item or not
    ///   - allowDelete: whether to allow to delete this item or not
    /// - Returns: A fully initialized timeline `Item`
    // swiftlint:disable:next function_parameter_count
    static func manualEventItem(id eventID: String,
                                filterID: TimelineFilterID,
                                title: String,
                                date: Date,
                                showTime: Bool,
                                eventType: TimelineClientEventType,
                                attributes: [TypedField],
                                advisorName: String,
                                storeName: String? = nil,
                                allowEdit: Bool = true,
                                allowDelete: Bool = true) -> Self {
        let action: ActionType = .routeDescriptorProvider(routeDescriptorFactory: { _ in
            return TimelineClientEventRouteDescriptor(mode: .read(eventID: eventID, allowEdit: allowEdit, allowDelete: allowDelete),
                                                      eventType: eventType)
        }, preferredPresentationStyle: .push)
        return TimelineItemDisplayable(id: eventID,
                                       filterId: filterID,
                                       date: date,
                                       title: title,
                                       subtitle: showTime ? DateFormatter.timeOnlyFormatter.string(for: date) : nil,
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       detail: Detail(attributes: attributes),
                                       action: action)
    }
}
