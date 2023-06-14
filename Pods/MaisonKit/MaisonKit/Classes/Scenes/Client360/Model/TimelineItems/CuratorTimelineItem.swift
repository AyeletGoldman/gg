// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension TimelineItemDisplayable {

    private enum Labels {
        static let curatorTimelineItemTitle = MKLocalizedString("client360.timeline.curator.title",
                                                                comment: "The default title to show on the timeline item for a curator entry")
    }

    /// Creates a new `TimelineItemDisplayable` instance
    /// - Parameters:
    ///   - curationId: the ID of the curation. This is so we can get the details if the item is tapped.
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date of this entry.
    ///   - channel: the channel that was used to perform this outreach type
    ///   - advisorName: the name of the advisor that made the curation
    ///   - storeName: optional. The name of the store that the advisor made the curation from.
    ///   - curationAssets: an array of assets to display in the timeline entry
    ///   - requireConfirmation: Whether to show the option to confirm or deny this timeline item.
    /// - Returns: A fully initialized timeline `Item`.
    static func curationTimelineItem(id curationId: String,
                                     filterId: TimelineFilterID = .outreach,
                                     date: Date,
                                     channel: String,
                                     advisorName: String,
                                     storeName: String? = nil,
                                     curationAssets: [MediaType] = [],
                                     requireConfirmation: Bool = false) -> Self {
        return TimelineItemDisplayable(id: curationId,
                                       filterId: filterId,
                                       date: date,
                                       title: Labels.curatorTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(from: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       mediaItems: curationAssets,
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [channel]), icon: "icon-app")
                                       ]),
                                       requireConfirmation: requireConfirmation)
    }
}
