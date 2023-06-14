// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// Model used for holding and displaying events represented as a timeline
public struct TimelineDisplayable {

    /// The array of sections used to group the different events
    public let sections: [Section]

    /// The array of filters available to sort the data
    public let filters: [Filter]

    /// Creates a new Timeline to be used in `Client360TimelineView`
    /// - Parameters:
    ///   - sections: An array of sections holding the different events
    ///   - filters: An array of filters available to sort the data
    public init(sections: [Section], filters: [Filter]) {
        self.sections = sections
        self.filters = filters
    }
}
