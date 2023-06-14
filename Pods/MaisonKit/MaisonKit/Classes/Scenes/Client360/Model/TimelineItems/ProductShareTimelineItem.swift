// Copyright © 2021 LVMH. All rights reserved.

import Foundation

public extension TimelineItemDisplayable {

    private enum Labels {
        static let productShareTimelineItemTitle = MKLocalizedString("client360.timeline.product-share.title",
                                                                     comment: "The default title to show on the timeline item for a given product share")
    }

    /// Creates a new `TimelineItemDisplayable` instance
    /// - Parameters:
    ///   - productShareId: the ID of the product share. This is so we can get the details if the item is tapped
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date of this entry.
    ///   - channel: the channel that was used to perform this outreach
    ///   - productName: the name of the product.
    ///   - advisorName: the name of the advisor that made the outreach
    ///   - storeName: optional. The name of the store that the advisor made the outreach from.
    ///   - productImages: an array of images to display in the timeline entry
    ///   - requireConfirmation: Whether to show the option to confirm or deny this timeline item.
    /// - Returns: A fully initialized timeline `Item`.
    static func productShareItem(id productShareId: String,
                                 filterId: TimelineFilterID = .outreach,
                                 date: Date,
                                 channel: String,
                                 productName: String,
                                 advisorName: String,
                                 storeName: String? = nil,
                                 productImages: [ImageSource] = [],
                                 requireConfirmation: Bool = false) -> Self {
        return TimelineItemDisplayable(id: productShareId,
                                       filterId: filterId,
                                       date: date,
                                       title: Labels.productShareTimelineItemTitle,
                                       subtitle: DateFormatter.timeOnlyFormatter.string(from: date),
                                       footer: storeName.map { String(format: TimelineLabels.advisorAndStoreFooterFormat, advisorName, $0) } ?? advisorName,
                                       mediaItems: productImages.map { .image(source: $0) },
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [channel]), icon: "icon-app"),
                                        TypedField(value: .text(lines: [productName]), icon: "icon-cart")
                                       ]),
                                       requireConfirmation: requireConfirmation)
    }
}
