// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import Combine

/// An implementation of `FilterDisplayView` that creates a `TextFilterView`
public struct TextFilter: FilterDisplayView {
    /// The ID for the filter
    public let filterId: FilterID
    /// The items to be filtered
    public let filterItems: [TextFilterView.Item]
    /// Whether the text filter allows for more than one item to be selected at a time
    public let selectionMode: SelectionMode
    /// Whether the selection is required or not
    public let required: Bool

    /// Creates a new `TextFilter` with the given ID and array of filter options.
    /// - Parameters:
    ///   - id: The ID for the filter
    ///   - filterItems: The items to be filtered
    ///   - selectionMode: Whether the text filter allows for more than one item to be selected at a time
    ///   - required: Whether the selection is required or not
    public init(id: FilterID,
                filterItems: [TextFilterView.Item],
                selectionMode: SelectionMode = .single,
                required: Bool = false) {
        self.filterItems = filterItems
        self.filterId = id
        self.selectionMode = selectionMode
        self.required = required
    }

    @ViewBuilder
    public func makeBody(selectedItems: Binding<SelectedFilters>,
                         totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?,
                         onSelectedPresent: @escaping (Never) -> Void) -> TextFilterView {
        TextFilterView(
            filterItems: self.filterItems,
            selectedItemIds: selectedItems.wrappedValue[self.filterId] ?? [],
            displayType: self.selectionMode == .single ? .plain : .checkMark,
            onSelect: { item in
                selectedItems.updateValueIfNecessary(self.filterId,
                                                     withItem: item.value,
                                                     isRequired: self.required,
                                                     selectionMode: self.selectionMode)
            }
        )
    }

    public func getFilterItemTitle(value: FilterValue) -> String? {
        return self.filterItems.filter { value.contains($0.value) }.map(\.displayName).first
    }
}

extension Binding where Value == SelectedFilters {
    func updateValueIfNecessary(_ filterId: FilterID,
                                withItem itemValue: FilterValue,
                                isRequired: Bool,
                                selectionMode: SelectionMode) {
        var filters = self.wrappedValue[filterId] ?? []
        if isRequired, filters.contains(itemValue), filters.count == 1 {
            return // no option to remove the selection when the filter is required and it's the only selection
        }
        switch selectionMode {
        case .multiple:
            filters.appendOrRemove(element: itemValue)
        case .single:
            filters = filters.contains(itemValue) ? [] : [itemValue]
        }
        if filters.isEmpty {
            self.wrappedValue.removeValue(forKey: filterId)
        } else {
            self.wrappedValue[filterId] = filters
        }
    }
}
