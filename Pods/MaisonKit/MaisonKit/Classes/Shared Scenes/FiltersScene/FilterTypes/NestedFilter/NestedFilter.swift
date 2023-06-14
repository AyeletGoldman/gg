// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import Combine

/// An implementation of `FilterDisplayView` that creates a `NestedFilterView`
public struct NestedFilter: FilterDisplayView {

    private enum Labels {
        static let doneButtonTitle = MKLocalizedString("nested-filter.navigationBar.trailing.done",
                                                       comment: "The title for done button on the nested list")
    }

    /// The ID for the filter
    public let filterId: FilterID
    /// The items to be filtered
    public let filterItems: [NestedFilterListItem]
    /// The title of the nested selection list page
    public let nestedListTitle: String
    /// The title format for the selected items
    public let selectedItemsTitleFormat: String
    /// The empty title of the selected items.
    public let emptySelectedItemsTitle: String?
    /// Whether the text filter allows for more than one item to be selected at a time
    public let selectionMode: SelectionMode
    /// Whether the selection is required or not
    public let required: Bool

    /// Creates a new `NestedFilter` with the given ID and array of filter options.
    /// - Parameters:
    ///   - id: The ID for the filter
    ///   - filterItems: The items to be filtered
    ///   - nestedListTitle: The title of the nested selection list page
    ///   - selectedItemsTitleFormat: The title format for the selected items
    ///   - emptySelectedItemsTitle: The empty title of the selected items.
    ///   - selectionMode: Whether the text filter allows for more than one item to be selected at a time
    ///   - required: Whether the selection is required or not
    public init(id: FilterID,
                filterItems: [NestedFilterListItem],
                nestedListTitle: String,
                selectedItemsTitleFormat: String,
                emptySelectedItemsTitle: String? = nil,
                selectionMode: SelectionMode = .single,
                required: Bool = false) {
        self.filterId = id
        self.filterItems = filterItems
        self.nestedListTitle = nestedListTitle
        self.selectedItemsTitleFormat = selectedItemsTitleFormat
        self.emptySelectedItemsTitle = emptySelectedItemsTitle
        self.selectionMode = selectionMode
        self.required = required
    }

    @ViewBuilder
    public func makeBody(selectedItems: Binding<SelectedFilters>,
                         totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?,
                         onSelectedPresent: @escaping (SelectionListScene) -> Void) -> NestedFilterView {
        NestedFilterView(
            filterItems: self.filterItems,
            selectedItemIds: selectedItems.getFilterValues(filterId: self.filterId),
            nestedListTitle: self.nestedListTitle,
            selectedItemsTitle: self.getSelectedItemsTitle,
            selectedItemsSubtitle: self.getSelectedItemsSubtitle,
            selectionMode: self.selectionMode,
            presentNestedSelectionList: {
                let scene = self.getSelectionListScene(selectedItemIds: selectedItems.getFilterValues(filterId: self.filterId),
                                                       totalItems: totalItems)
                onSelectedPresent(scene)
            }
        )
    }

    public func getFilterItemTitle(value: FilterValue) -> String? {
        return self.filterItems.filter { value.contains($0.id) }.map(\.title).first
    }

    public func getSelectedItemsTitle(selectedItemIds: [FilterValue]) -> String? {
        guard let firstValue = selectedItemIds.first,
              let singular = self.getFilterItemTitle(value: firstValue) else {
            return self.emptySelectedItemsTitle
        }
        // We want to show the title if it's only one, if it's more than one we show the format
        if selectedItemIds.count == 1 {
            return singular
        } else {
            return String(format: self.selectedItemsTitleFormat, selectedItemIds.count)
        }
    }

    public func getSelectedItemsSubtitle(selectedItemIds: [FilterValue]) -> String? {
        guard selectedItemIds.count > 1 else {
            return nil
        }
        let selectedItemsTitles = self.filterItems.filter { selectedItemIds.contains($0.id) }.map(\.title)
        return selectedItemsTitles.joined(separator: ", ")
    }

    private func getSelectionListScene(selectedItemIds: Binding<[FilterValue]>,
                                       totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>?) -> SelectionListScene {
        if let totalItems {
            return self.getSelectionListSceneWithDataSource(selectedItemIds: selectedItemIds, totalItems: totalItems)
        } else {
            return self.getSimpleSelectionListScene(selectedItemIds: selectedItemIds)
        }
    }

    private func getSimpleSelectionListScene(selectedItemIds: Binding<[FilterValue]>) -> SelectionListScene {
        return SelectionListScene(
            items: self.filterItems,
            selection: Set(selectedItemIds.wrappedValue),
            selectionMode: self.selectionMode,
            title: self.nestedListTitle,
            onDismiss: { controllerToDismiss in
                controllerToDismiss.dismiss(animated: true, completion: nil)
            },
            doneButtonTitle: Labels.doneButtonTitle,
            onDone: { controllerToDismiss, selection in
                selectedItemIds.wrappedValue = Array(selection)
                controllerToDismiss.dismiss(animated: true, completion: nil)
            },
            shouldShowToolbar: !self.required || self.selectionMode == .multiple,
            isRequired: self.required,
            rowStylistIdentifier: { item in
                let variant = item.isEnabled ? "radio-box-preview" : "radio-box-preview-disabled"
                return StylistIdentifier.buildFullIdentifier(for: "input", variant: variant)
            }
        )
    }

    private func getSelectionListSceneWithDataSource(selectedItemIds: Binding<[FilterValue]>,
                                                     totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>) -> SelectionListScene {
        return SelectionListScene(
            dataSource: NestedFilterDataSource(filterItems: self.filterItems,
                                               selectedItemIds: selectedItemIds,
                                               totalItems: totalItems),
            selectionMode: self.selectionMode,
            title: self.nestedListTitle,
            onDismiss: { [originalSelectedItemIds = selectedItemIds.wrappedValue] controllerToDismiss in
                selectedItemIds.wrappedValue = originalSelectedItemIds
                controllerToDismiss.dismiss(animated: true, completion: nil)
            },
            doneButtonTitle: Labels.doneButtonTitle,
            onDone: { controllerToDismiss, _ in
                controllerToDismiss.dismiss(animated: true, completion: nil)
            },
            shouldShowToolbar: !self.required || self.selectionMode == .multiple,
            isRequired: self.required,
            rowStylistIdentifier: { item in
                let variant = item.isEnabled ? "radio-box-preview" : "radio-box-preview-disabled"
                return StylistIdentifier.buildFullIdentifier(for: "input", variant: variant)
            }
        )
    }
}

private extension Binding where Value == SelectedFilters {
    func getFilterValues(filterId: FilterID) -> Binding<[FilterValue]> {
        return Binding<[FilterValue]> { () -> [FilterValue] in
            return self.wrappedValue[filterId] ?? []
        } set: { (newValue: [FilterValue]) in
            self.wrappedValue[filterId] = newValue
        }
    }
}
