// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension TimelineDisplayable {
    /// Model used for holding and displaying an event of the timeline
    struct Entry: Identifiable {

        /// Unique identifier for this entry; usually the timeline entry ID.
        public let id: String

        /// The item's filter ID, so that it may be filtered out if necessary
        public let filterId: TimelineFilterID

        /// A view builder that will create the view to be displayed.
        /// This property can be used to customise the view that is displayed for this timeline entry.
        public let cellProvider: TimelineEntryCellProvider

        /// An optional action to perform when the entry is tapped.
        /// If this property is `nil`, the entry will not be tappable.
        public let action: ActionType?

        /// Creates a new `TimelineDisplayable.Entry`
        /// - Parameters:
        ///   - id: Unique identifier for this entry; usually the timeline entry ID.
        ///   - filterId: The item's filter ID, so that it may be filtered out if necessary
        ///   - cellProvider: A view builder that will create the view to be displayed.
        ///   This property can be used to customise the view that is displayed for this timeline entry.
        ///   - action: An optional action to perform when the entry is tapped.
        ///   If this property is `nil`, the entry will not be tappable.
        public init(id: String,
                    filterId: TimelineFilterID,
                    cellProvider: TimelineEntryCellProvider,
                    action: ActionType?) {
            self.id = id
            self.filterId = filterId
            self.cellProvider = cellProvider
            self.action = action
        }
    }
}

public extension TimelineDisplayable.Entry {

    /// Model used for holding and displaying additional and concise informations of a timeline item
    struct Detail {

        /// Various informations meant to be displayed above the bottomAttributes
        public let attributes: [TypedField]

        /// Creates a new Detail to be used in the timeline part in Client360 screen
        /// - Parameters:
        ///   - attributes: Various informations meant to be displayed in a list on the timeline cell
        public init(attributes: [TypedField]) {
            self.attributes = attributes
        }

        /// Creates a new Detail with empty informations
        public static let empty = Detail(attributes: [])
    }
}
