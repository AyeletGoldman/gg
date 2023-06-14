// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension TimelineItemDisplayable {

    internal enum OutreachLabels {
        static let outreachTimelineItemTitle = MKLocalizedString("client360.timeline.outreach.title",
                                                                 comment: "The default title to show on the timeline item for an outreach")
    }

    /// Creates a new `TimelineItemDisplayable` instance formatted for a typical "Outreach" item
    /// - Parameters:
    ///   - outreachId: the ID of the outreach. This is so we can get the details if the item is tapped
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date of this entry.
    ///   - channelName: the channel that was used to perform this outreach
    ///   - advisorName: the name of the advisor that made the outreach
    ///   - storeName: optional. The name of the store that the advisor made the outreach from.
    ///   - templateTitle: optional. If a template was used, the title of the template.
    ///   - requireConfirmation: Whether to show the option to confirm or deny this timeline item.
    /// - Returns: A fully initialized timeline `Item`
    static func outreachItem(id outreachId: String,
                             filterId: TimelineFilterID = .outreach,
                             date: Date,
                             channelName: String,
                             advisorName: String,
                             storeName: String? = nil,
                             templateTitle: String? = nil,
                             requireConfirmation: Bool = false) -> Self {
        return TimelineItemDisplayable(id: outreachId,
                                       filterId: filterId,
                                       date: date,
                                       title: OutreachLabels.outreachTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(for: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [channelName]), icon: "icon-app"),
                                        templateTitle.map { TypedField(value: .text(lines: [$0]), icon: "icon-template") }
                                       ].compactMap { $0 }),
                                       requireConfirmation: requireConfirmation)
    }
}
