// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension TimelineFilterID {

    /// A convenience timeline filter ID for outreach items
    static let outreach = TimelineFilterID(value: "outreach")

    /// A convenience timeline filter ID for newsletter items
    static let newsletter = TimelineFilterID(value: "newsletter")

    /// A convenience timeline filter ID for transaction items
    static let transaction = TimelineFilterID(value: "transaction")

    /// A convenience timeline filter ID for important dates items
    static let importantDate = TimelineFilterID(value: "importantDate")
}

public extension TimelineDisplayable.Filter {

    /// A convenience filter for the outreach category
    static let outreach = Self(id: .outreach,
                               name: MKLocalizedString("client360.timeline.filters.outreach.title",
                                                       comment: "Title for the outreach filter type"))

    /// A convenience filter for the newsletter category
    static let newsletter = Self(id: .newsletter,
                                 name: MKLocalizedString("client360.timeline.filters.newsletter.title",
                                                         comment: "Title for the newsletter filter type"))

    /// A convenience filter for the transaction category
    static let transaction = Self(id: .transaction,
                                  name: MKLocalizedString("client360.timeline.filters.transaction.title",
                                                          comment: "Title for the transaction filter type"))

    /// A convenience filter for the consultation category
    static let consultation = Self(id: .consultation,
                                   name: MKLocalizedString("client360.timeline.filters.consultation.title",
                                                           comment: "Title for the consultation filter type"))

    /// A convenience filter for the important date category
    static let importantDate = Self(id: .importantDate,
                                    name: MKLocalizedString("client360.timeline.filters.important-date.title",
                                                            comment: "Title for the important date filter type"))
}
