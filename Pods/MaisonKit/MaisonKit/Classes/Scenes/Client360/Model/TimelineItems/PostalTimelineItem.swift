// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension TimelineItemDisplayable {

    private enum Labels {
        static let postalEventDetail = MKLocalizedString("client360.timeline.outreach.postal.title",
                                                         comment: "The default title to show on the timeline item for a postal outreach")
    }

    /// Creates a new `TimelineItemDisplayable` instance formatted for a typical "Postal" outreach item
    /// - Parameters:
    ///   - outreachId: the ID of the outreach. This is so we can get the details if the item is tapped
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date of this entry.
    ///   - notes: any notes that are available about this postal outreach
    ///   - advisorName: the name of the advisor that made the outreach
    ///   - storeName: optional. The name of the store that the advisor made the outreach from.
    /// - Returns: A fully initialized timeline `Item`
    static func postalItem(id outreachId: String,
                           filterId: TimelineFilterID = .outreach,
                           date: Date,
                           notes: String? = nil,
                           advisorName: String,
                           storeName: String? = nil) -> Self {
        return TimelineItemDisplayable(id: outreachId,
                                       filterId: filterId,
                                       date: date,
                                       title: OutreachLabels.outreachTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(for: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [Labels.postalEventDetail]), icon: "icon-app"),
                                        notes.map { TypedField(value: .text(lines: [$0]), icon: "icon-template")}
                                       ].compactMap { $0 }))
    }
}
