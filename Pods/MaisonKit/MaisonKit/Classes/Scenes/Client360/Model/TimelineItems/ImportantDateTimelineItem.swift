// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension TimelineItemDisplayable {

    private enum Labels {
        static let importantDateTimelineItemTitle = MKLocalizedString("client360.timeline.important-date.title",
                                                                   comment: "The default title to show on the timeline item for an important date")
    }

    /// Creates a new `TimelineItemDisplayable` instance
    /// - Parameters:
    ///   - importantDateId: the ID of the importantdate. This is so we can get the details if the item is tapped
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date of this entry.
    ///   - eventName: the name of the event. This could be "Birthday", "Anniversary" etc
    /// - Returns: A fully initialized timeline `Item`.
    static func importantDateItem(id importantDateId: String,
                                  filterId: TimelineFilterID = .importantDate,
                                  date: Date,
                                  eventName: String) -> Self {
        return TimelineItemDisplayable(id: importantDateId,
                                       filterId: filterId,
                                       date: date,
                                       title: Labels.importantDateTimelineItemTitle,
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [eventName]))
                                       ]))
    }
}
