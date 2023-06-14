// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// Model used for holding and displaying an event of the timeline
public struct TimelineItemDisplayable: Identifiable {

    /// Unique identifier used for layout identification
    public let id: String

    /// The item's filter ID, so that it may be filtered out if necessary
    public let filterId: TimelineFilterID

    /// The date when the item occured
    public let date: Date

    /// The title of the item displayed to the user
    public let title: String

    /// Optional. The subtitle of the item displayed to the user. This is usually a time stamp, or a time range e.g. "6pm", "12:00 - 13:00"...
    public let subtitle: String?

    /// An optional tag associated to the item
    public let tag: String?

    /// An optional tag variant associated to the item
    public let tagVariant: String?

    /// Optional. A footer to display on the bottom of the timeline item cell.
    /// This is usually the source of the event.  e.g. a client advisor name, the work "Headquarters" etc.
    public let footer: String?

    /// An array of media items to show in a carousel
    public let mediaItems: [MediaType]

    /// Additional and concise informations about the item
    public let detail: Detail

    /// The action to perform when tapping the timeline item
    public let action: ActionType?

    /// Whether to show the option to confirm or deny this timeline item.
    public let requireConfirmation: Bool

    /// Creates a new Item to be used in the timeline part
    /// - Parameters:
    ///   - id: The unique identifier of the item
    ///   - filterId: The item's filter ID, so that it may be filtered out if necessary
    ///   - date: The date when the item occured
    ///   - title: The name of the section displayed to the user
    ///   - subtitle: Optional. The subtitle of the item displayed to the user.
    ///   This is usually a time stamp, or a time range e.g. "6pm", "12:00 - 13:00"...
    ///   - footer: Optional. A footer to display on the bottom of the timeline item cell.
    ///   This is usually the source of the event. e.g. a client advisor name, the work "Headquarters" etc
    ///   - tag: An optional tag associated to the item
    ///   - tagVariant: An optional tag variant associated to the item
    ///   - mediaItems: .An array of media items to show in a carousel
    ///   - detail: Additional and concise informations about the item
    ///   - action: The action to perform when tapping the timeline item
    ///   - requireConfirmation: Whether to show the option to confirm or deny this timeline item.
    public init(id: String,
                filterId: TimelineFilterID,
                date: Date,
                title: String,
                subtitle: String? = nil,
                footer: String? = nil,
                tag: String? = nil,
                tagVariant: String? = nil,
                mediaItems: [MediaType] = [],
                detail: Detail = .empty,
                action: ActionType? = nil,
                requireConfirmation: Bool = false) {
        self.id = id
        self.filterId = filterId
        self.date = date
        self.title = title
        self.subtitle = subtitle
        self.tag = tag
        self.tagVariant = tagVariant
        self.detail = detail
        self.footer = footer
        self.mediaItems = mediaItems
        self.action = action
        self.requireConfirmation = requireConfirmation
    }
}

public extension TimelineItemDisplayable {

    /// Model used for holding and displaying additional and concise informations of a timeline item
    struct Detail {

        /// Various informations meant to be displayed above the bottomAttributes
        let attributes: [TypedField]

        /// Creates a new Detail to be used in the timeline item part
        /// - Parameters:
        ///   - attributes: Various informations meant to be displayed in a list on the timeline cell
        public init(attributes: [TypedField]) {
            self.attributes = attributes
        }

        /// Creates a new Detail with empty informations
        public static let empty = Detail(attributes: [])
    }
}

public extension TimelineDisplayable.Entry {

    /// Creates a new TimelineDisplayable.Entry from a given TimelineItemDisplayable
    /// - Parameter item: the timeline item displayable to transform into a TimelineDisplayable.Entry.
    init(item: TimelineItemDisplayable) {
        self.init(id: item.id,
                  filterId: item.filterId,
                  cellProvider: TimelineEntryCellProvider(
                    date: item.date,
                    title: item.title,
                    subtitle: item.subtitle,
                    footer: item.footer,
                    tag: item.tag,
                    tagVariant: item.tagVariant,
                    mediaItems: item.mediaItems,
                    detail: TimelineDisplayable.Entry.Detail(attributes: item.detail.attributes),
                    showDisclosureIndicator: item.action != nil,
                    requireConfirmation: item.requireConfirmation),
                  action: item.action)
    }
}
