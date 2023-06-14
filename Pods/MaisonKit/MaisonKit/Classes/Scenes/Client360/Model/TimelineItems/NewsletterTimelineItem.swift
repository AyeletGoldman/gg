// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension TimelineItemDisplayable {

    private enum Labels {
        static let newsletterTimelineItemTitle = MKLocalizedString("client360.timeline.newsletter.title",
                                                                   comment: "The default title to show on the timeline item for a given newsletter")
        static let newsletterTimelineItemSentBy = MKLocalizedString("client360.timeline.newsletter.sentBy",
                                                                   comment: "The default 'sent by' entity to show on the timeline item for a newsletter")
    }

    /// Creates a new `TimelineItemDisplayable` instance
    /// - Parameters:
    ///   - newsletterId: the ID of the newsletter. This is so we can get the details if the item is tapped
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - title: optional. If no title is given, this will default to the translated version of `client360.timeline.newsletter.title`.
    ///   - date: the date of this entry.
    ///   - subject: the newsletter's subject. To be shown alongside an icon.
    ///   - sentBy: the name of the person or entity that sent the newsletter. If `nil` will default to the translated version of `client360.timeline.newsletter.sentBy`.
    /// - Returns: A fully initialized timeline `Item`.
    static func newsletterItem(id newsletterId: String,
                               filterId: TimelineFilterID = .newsletter,
                               title: String? = nil,
                               date: Date,
                               subject: String,
                               sentBy: String? = nil) -> Self {
        return TimelineItemDisplayable(id: newsletterId,
                                       filterId: filterId,
                                       date: date,
                                       title: title ?? Labels.newsletterTimelineItemTitle,
                                       footer: sentBy ?? Labels.newsletterTimelineItemSentBy,
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [subject]), icon: "icon-newsletter")
                                       ]))
    }
}
