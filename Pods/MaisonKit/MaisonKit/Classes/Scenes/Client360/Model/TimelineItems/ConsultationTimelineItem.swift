// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A consultation event type, usually `inStore` or `virtual` but open to extension.
public typealias ConsultationTypeTitle = String

public extension ConsultationTypeTitle {
    /// The default title for an `inStore` consultation. Override this by updating the translation for `client360.timeline.consultation.type.instore.title`
    static let inStore = MKLocalizedString("client360.timeline.consultation.type.instore.title",
                                           comment: "The type of a consultation that is in-store")
    /// The default title for an `virtual` consultation. Override this by updating the translation for `client360.timeline.consultation.type.virtual.title`
    static let virtual = MKLocalizedString("client360.timeline.consultation.type.virtual.title",
                                           comment: "The type of a consultation that is virtual")
}

public extension TimelineItemDisplayable {

    internal enum ConsultationLabels {
        static let consultationTimelineItemTitle = MKLocalizedString("client360.timeline.consultation.title",
                                                                     comment: "The default title to show on the timeline item for a consultation")
    }

    /// Creates a new `TimelineItemDisplayable` instance
    /// - Parameters:
    ///   - consultationId: the ID of the consultation. This is so we can get the details if the item is tapped
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date at which the consultation happened. This is so we can get the details if the item is tapped
    ///   - consultationType: the type of consultation; usually `.inStore` or `.virtual` but can be any other (localized) string.
    ///   - timeRange: the range of time the consultation happened on.
    ///   - advisorName: the name of the advisor that carried or will carry out the consultation.
    ///   - storeName: the name of the store iin which the client advisor that carries out the consultation is attributed to.
    /// - Returns: A fully initialized timeline `Item`.
    static func consultationItem(id consultationId: String,
                                 filterId: TimelineFilterID = .consultation,
                                 date: Date,
                                 consultationType: ConsultationTypeTitle,
                                 timeRange: TimeRange?,
                                 advisorName: String,
                                 storeName: String? = nil) -> Self {
        let range: String? = timeRange.map { range -> String in
            guard let endTime = range.endTime else {
                return DateFormatter.timeOnlyFormatter.string(from: range.startTime)
            }
            return DateFormatter.shortTimeRangeFormatter.string(from: range.startTime, to: endTime)
        }
        let action = ActionType.routeDescriptorProvider(routeDescriptorFactory: { _ in
            return AppointmentDetailsRouteDescriptor(appointmentId: consultationId, shouldAllowClient360Navigation: false)
        })
        return TimelineItemDisplayable(id: consultationId,
                                       filterId: filterId,
                                       date: date,
                                       title: ConsultationLabels.consultationTimelineItemTitle,
                                       subtitle: range,
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [consultationType]))
                                       ]),
                                       action: action)
    }
}
