// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import Combine

/// An implementation of `FilterDisplayView` that creates an `ImageFilterView`
public struct ImageFilter: FilterDisplayView {
    /// The ID for the filter
    public let filterId: FilterID
    /// The items to be filtered
    public let filterItems: [ImageFilterItemView.Item]
    /// The type of how to display the items
    public let displayType: ImageFilterView.DisplayType
    /// Whether the text filter allows for more than one item to be selected at a time
    public let selectionMode: SelectionMode
    /// Whether the selection is required or not
    public let required: Bool

    /// Creates a new `ImageFilterView` with the given ID and array of items
    /// - Parameters:
    ///   - id: The ID for the filter
    ///   - filterItems: The items to be filtered
    ///   - displayType: The type of how to display the items
    ///   - selectionMode: Whether the text filter allows for more than one item to be selected at a time
    ///   - required: Whether the selection is required or not
    public init(id: FilterID,
                filterItems: [ImageFilterItemView.Item],
                displayType: ImageFilterView.DisplayType,
                selectionMode: SelectionMode = .multiple,
                required: Bool = false) {
        self.filterId = id
        self.filterItems = filterItems
        self.displayType = displayType
        self.selectionMode = selectionMode
        self.required = required
    }

    @ViewBuilder
    public func makeBody(selectedItems: Binding<SelectedFilters>,
                         totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?,
                         onSelectedPresent: @escaping (Never) -> Void) -> ImageFilterView {
        ImageFilterView(
            filterItems: self.filterItems,
            displayType: self.displayType,
            selectedItemIds: selectedItems.wrappedValue[self.filterId] ?? [],
            onSelect: { item in
                selectedItems.updateValueIfNecessary(self.filterId,
                                                     withItem: item.id,
                                                     isRequired: self.required,
                                                     selectionMode: self.selectionMode)
            }
        )
    }

    public func getFilterItemTitle(value: FilterValue) -> String? {
        return self.filterItems.filter { value.contains($0.id) }.compactMap(\.title).first
    }
}
