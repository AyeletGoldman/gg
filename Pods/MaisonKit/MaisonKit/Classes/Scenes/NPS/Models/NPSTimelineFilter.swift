// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension TimelineFilterID {

    /// A convenience timeline filter ID for nps items
    static let nps = TimelineFilterID(value: "nps")
}

public extension TimelineDisplayable.Filter {

    /// A convenience filter for the nps category
    static let nps = Self(id: .nps,
                          name: MKLocalizedString("client360.timeline.filters.nps.title",
                                                  comment: "Title for the nps filter type"))
}
