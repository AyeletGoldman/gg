// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct NestedFilterView: View {

    private enum Labels {
        static let defaultEmptySelectedItemsTitle = MKLocalizedString("nested-filter.selectedItems.empty",
                                                                      comment: "The empty title of the selected items on nested filter")
    }

    /// The items to use as filtering values.
    private let filterItems: [SelectionListItem]
    /// The title of the nested selection list page
    private let nestedListTitle: String
    /// The title of the selected items.
    private let selectedItemsTitle: (_ selectedItemIds: [FilterValue]) -> String?
    /// The subtitle of the selected items.
    private let selectedItemsSubtitle: (_ selectedItemIds: [FilterValue]) -> String?
    /// Whether the text filter allows for more than one item to be selected at a time
    private let selectionMode: SelectionMode
    /// The method to present the selection list
    private let presentNestedSelectionList: () -> Void
    /// The array of selected items
    @Binding private var selectedItemIds: [FilterValue]
    /// Wherher to show the nested list by activating the navigation link
    @State private var showSelectionList: Bool = false

    /// Creates a new `NestedFilterView` with the given parameters.
    /// - Parameter filterItems: the items to use as filtering values.
    /// - Parameter selectedItemIds: the array of selected items.
    /// - Parameter nestedListTitle: the title of the nested selection list page.
    /// - Parameter selectedItemsTitle: the title of the selected items.
    /// - Parameter selectedItemsSubtitle: the subtitle of the selected items.
    /// - Parameter selectionMode: whether the text filter allows for more than one item to be selected at a time.
    /// - Parameter presentNestedSelectionList: the method to present the selection list.
    public init(filterItems: [SelectionListItem],
                selectedItemIds: Binding<[FilterValue]>,
                nestedListTitle: String,
                selectedItemsTitle: @escaping (_ selectedItemIds: [FilterValue]) -> String?,
                selectedItemsSubtitle: @escaping (_ selectedItemIds: [FilterValue]) -> String?,
                selectionMode: SelectionMode,
                presentNestedSelectionList: @escaping () -> Void) {
        self.filterItems = filterItems
        self._selectedItemIds = selectedItemIds
        self.nestedListTitle = nestedListTitle
        self.selectedItemsTitle = selectedItemsTitle
        self.selectedItemsSubtitle = selectedItemsSubtitle
        self.selectionMode = selectionMode
        self.presentNestedSelectionList = presentNestedSelectionList
    }

    public var body: some View {
        Button(
            action: self.presentNestedSelectionList,
            label: {
                ListItemView(title: self.selectedItemsTitle(self.selectedItemIds) ?? Labels.defaultEmptySelectedItemsTitle,
                             subtitle: self.selectedItemsSubtitle(self.selectedItemIds),
                             icon: "icon-right"
                )
                .styleAsListRow(variant: "stacked")
            }
        )
    }
}
