// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import MaisonKit

let mockFilters: [FilterData] = [
    FilterData(
        title: "Members",
        pluralTitleFormat: "Members in plural",
        viewBuilder: .imageFilter(ImageFilter(id: UUID().uuidString,
                                              filterItems: imageFilterItems,
                                              displayType: .carrousel))
    ),
    FilterData(
        title: "Timespan",
        pluralTitleFormat: "Timespan in plural",
        viewBuilder: .textFilter(TextFilter(id: UUID().uuidString, filterItems: textFilterItems))
    ),
    FilterData(
        title: "Required Timespan",
        pluralTitleFormat: "Timespan in plural",
        viewBuilder: .textFilter(TextFilter(id: UUID().uuidString, filterItems: textFilterItems, required: true))
    ),
    FilterData(
        title: "Timespan multi selection",
        pluralTitleFormat: "Multi plural",
        viewBuilder: .textFilter(TextFilter(id: UUID().uuidString, filterItems: textFilterItems, selectionMode: .multiple))
    ),
    FilterData(
        title: "Members",
        pluralTitleFormat: "Members plural 2",
        viewBuilder: .imageFilter(ImageFilter(id: UUID().uuidString,
                                              filterItems: imageFilterItems,
                                              displayType: .rows,
                                              required: true))
    ),
    FilterData(
        title: "Nested Filter",
        pluralTitleFormat: "Nested plural",
        viewBuilder: .nestedFilter(NestedFilter(id: UUID().uuidString,
                                                filterItems: nestedFilterItems,
                                                nestedListTitle: "Nested Filter Title",
                                                selectedItemsTitleFormat: "%d clients selected",
                                                emptySelectedItemsTitle: "No items selected",
                                                selectionMode: .multiple,
                                                required: true))
    )
]

private let imageFilterItems: [ImageFilterItemView.Item] = [
    .init(id: "1", title: "My Store", content: .color(.red)),
    .init(id: UUID().uuidString, title: "Doc", content: .text("DD")),
    .init(id: UUID().uuidString, title: "Happy", content: .image(.system(name: "star.fill"))),
    .init(id: UUID().uuidString, title: "Sneezy", content: .image(.url(URL(string: "https://picsum.photos/200")!))),
    .init(id: UUID().uuidString, title: "Sleepy", content: .color(.orange)),
    .init(id: UUID().uuidString, title: "Bashful", content: .color(.green)),
    .init(id: UUID().uuidString, title: "Grumpy", content: .color(.blue)),
    .init(id: UUID().uuidString, title: "Dopey", content: .color(.pink))
]

private let textFilterItems: [TextFilterView.Item] = [
    .init(displayName: "Today", value: "today"),
    .init(displayName: "Yesteday", value: "yesterday"),
    .init(displayName: "This week", value: "this-week"),
    .init(displayName: "Last week", value: "last-week"),
    .init(displayName: "Last month", value: "this-month")
]

private let nestedFilterItems: [SelectionListItem] = [
    .init(id: UUID().uuidString, title: "My Store", content: .color(.red)),
    .init(id: UUID().uuidString, title: "Happy", content: .image(.system(name: "star.fill"))),
    .init(id: UUID().uuidString, title: "Sneezy", content: .image(.url(URL(string: "https://picsum.photos/200")!))),
    .init(id: UUID().uuidString, title: "Sleepy", content: .color(.orange)),
    .init(id: UUID().uuidString, title: "Bashful", content: .color(.green)),
    .init(id: UUID().uuidString, title: "Grumpy", content: .color(.blue)),
    .init(id: UUID().uuidString, title: "Dopey", content: .color(.pink))
]
