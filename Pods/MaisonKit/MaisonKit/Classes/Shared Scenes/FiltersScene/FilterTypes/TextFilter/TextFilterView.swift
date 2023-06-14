// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A view that shows a title and a "tag cloud" style set of text items used to filter. The "tag cloud" expands horizontally until there is no
/// more space to do so and then grows vertically.
public struct TextFilterView: View {

    public enum DisplayType {
        case plain
        case checkMark
    }

    /// Defines an item that can be shown in a `TextFilterView`
    public struct Item: Equatable {

        // swiftlint:disable:next operator_whitespace
        public static func ==(lhs: Self, rhs: Self) -> Bool {
            return lhs.value == rhs.value
        }

        /// The item's display value
        public let displayName: String
        /// The item's identifier, usually used to send back to the filtering service. Must be unique.
        public let value: FilterValue
        /// Whether this filter is enabled or not
        public let isEnabled: Bool
        /// The total matched items if the user will choose this filter item. In case of zero this item will be disabled.
        public let totalItems: Int?

        /// Creates a new `TextFilterView.Item`
        /// - Parameters:
        ///   - displayName: The item's display value.
        ///   - value: The item's identifier, usually used to send back to the filtering service. Must be unique.
        ///   - isEnabled: Whether this filter is enabled or not.
        ///   This allows the implementer to show some filters as disabled if they are not available or if they would produce no results.
        public init(displayName: String, value: FilterValue, isEnabled: Bool = true) {
            self.displayName = displayName
            self.value = value
            self.isEnabled = isEnabled
            self.totalItems = nil
        }

        /// Creates a new `TextFilterView.Item`
        /// - Parameters:
        ///   - displayName: The item's display value.
        ///   - value: The item's identifier, usually used to send back to the filtering service. Must be unique.
        ///   - totalItems: The total matched items if the user will choose this filter item. In case of zero this item will be disabled.
        public init(displayName: String, value: FilterValue, totalItems: Int) {
            self.displayName = displayName
            self.value = value
            self.isEnabled = totalItems > 0
            self.totalItems = totalItems
        }
    }

    /// The items to use as filtering values.
    public let filterItems: [Item]
    /// The selected items in this "tag cloud"
    public let selectedItemIds: [FilterValue]
    /// The type of how to display the items
    private let displayType: DisplayType
    /// The closure to invoke when a filter item is selected (or deselected!)
    private let onSelect: (Item) -> Void

    /// Creates a new `TextFilterView` with the given parameters.
    /// - Parameters:
    ///   - filterItems: the items to use as filtering values.
    ///   - selectedItemIds: the array of selected items.
    ///   - displayType: The type of how to display the items
    ///   - onSelect: The closure to invoke when a filter item is selected (or deselected!)
    public init(filterItems: [Item],
                selectedItemIds: [FilterValue],
                displayType: DisplayType,
                onSelect: @escaping (Item) -> Void) {
        self.filterItems = filterItems
        self.selectedItemIds = selectedItemIds
        self.displayType = displayType
        self.onSelect = onSelect
    }

    public var body: some View {
        TagCloud(items: self.filterItems.map { item -> IdentifiableView in
            let itemIsSelected = self.selectedItemIds.contains(item.value)
            let buttonData = ButtonData(label: item.displayName,
                                        action: {
                                            self.onSelect(item)
                                        })
            return self.buildFilterButton(data: buttonData, isSelected: itemIsSelected, item: item)
                .asIdentifiableView(id: item.value)
        })
        .padding(.top, 10)
        .padding(.horizontal)
    }

    @ViewBuilder
    private func buildFilterButton(data: ButtonData, isSelected: Bool, item: TextFilterView.Item) -> some View {
        switch self.displayType {
        case .checkMark:
            self.buildFilterButton(data: data, isSelected: isSelected, item: item, style: .checkmark)
        case .plain:
            self.buildFilterButton(data: data, isSelected: isSelected, item: item, style: .plain)
        }
    }

    private func buildFilterButton<Style: FilterButtonStyle>(data: ButtonData, isSelected: Bool, item: TextFilterView.Item, style: Style) -> some View {
        return FilterButton(title: data.label,
                            isSelected: isSelected,
                            totalItems: item.totalItems,
                            action: data.action)
        .filterButtonStyle(style)
        .disabled(!item.isEnabled)
    }
}
