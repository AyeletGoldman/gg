// Copyright © 2022 LVMH. All rights reserved.

import Foundation

private enum Labels {
    static let title = MKLocalizedString("client360.timeline.nps.title",
                                         comment: "The title to show on the timeline nps item")
}

public extension TimelineItemDisplayable {

    /// Creates a new `TimelineItemDisplayable` instance
    /// - Parameters:
    ///   - npsId: the ID of the nps. This is so we can get the details if the item is tapped
    ///   - filterId: a filter ID for this item. This will control when the filter is shown or hidden.
    ///   - date: the date at which the NPS happened.
    ///   - score: the score given to this NPS. This also includes the maximum score and the variant to control the colour of the badge view.
    ///   - source: The source of this NPS. There are pre-defined categories that can be used, and are translated by MaisonKit. Or you can create your own.
    ///         MaisonKit ships with: `.inStorePayment`, `.postWebPayment`, `.postWebDelivery`.
    /// - Returns: A fully initialized timeline `Item`.
    static func npsItem(id npsId: String,
                        filterId: TimelineFilterID = .nps,
                        date: Date,
                        score: NPSScore,
                        source: NPSEventSource) -> Self {
        let action = ActionType.routeDescriptorProvider(routeDescriptorFactory: { _ in
            return NPSDetailsRouteDescriptor(id: npsId)
        })
        return TimelineItemDisplayable(id: npsId,
                                       filterId: filterId,
                                       date: date,
                                       title: Labels.title,
                                       footer: "didüenjoy",
                                       tag: score.displayableValue,
                                       tagVariant: score.identifierVariant,
                                       detail: Detail(attributes: [
                                        TypedField(value: .text(lines: [source.displayableValue]))
                                       ]),
                                       action: action)
    }
}
