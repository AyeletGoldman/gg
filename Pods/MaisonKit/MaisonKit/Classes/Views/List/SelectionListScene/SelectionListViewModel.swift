// Copyright © 2021 LVMH. All rights reserved.

import Combine
import SwiftUI

/// The view model to handle selections
final public class SelectionListViewModel: ObservableObject {

    @Published var items: [SelectionListItem] = []
    let rowStylistIdentifier: (SelectionListItem) -> String
    let selectionMode: SelectionMode
    let title: String
    let doneButtonTitle: String
    private let _onDone: (Set<String>) -> Void
    let onDismiss: (() -> Void)?
    let shouldShowToolbar: Bool
    let isRequired: Bool

    /// These two bindings make the decision on whether we are `.single` or `.multiple`
    /// selection. When using one of the initializers that takes one of these as parameters, the
    /// selection style is set up.
    @Published var selectedItems: Set<String> = Set()
    @Published var selectedItem: String?
    @Published var isValidSelection: Bool = true
    @Published var totalItems: ResultState<String, ErrorDisplayable> = .waiting

    private var cancellables = Set<AnyCancellable>()

    public init(items: [SelectionListItem],
                selection: Set<String> = [],
                selectionMode: SelectionMode,
                title: String,
                onDismiss: (() -> Void)? = nil,
                doneButtonTitle: String,
                onDone: @escaping (Set<String>) -> Void,
                shouldShowToolbar: Bool = false,
                isRequired: Bool = false,
                rowStylistIdentifier: @escaping (SelectionListItem) -> String) {
        self.items = items
        self.selectionMode = selectionMode
        self.title = title
        self.onDismiss = onDismiss
        self.doneButtonTitle = doneButtonTitle
        if selectionMode == .multiple {
            self.selectedItems = selection
            self.selectedItem = nil
        } else {
            self.selectedItems = []
            self.selectedItem = selection.first
        }
        self._onDone = onDone
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.rowStylistIdentifier = rowStylistIdentifier

        self.setupValidationSubscription()
    }

    public init(dataSource: SelectionListDataSource,
                selectionMode: SelectionMode,
                title: String,
                onDismiss: (() -> Void)? = nil,
                doneButtonTitle: String,
                onDone: @escaping (Set<String>) -> Void,
                shouldShowToolbar: Bool = false,
                isRequired: Bool = false,
                rowStylistIdentifier: @escaping (SelectionListItem) -> String) {
        self.selectionMode = selectionMode
        self.title = title
        self.onDismiss = onDismiss
        self.doneButtonTitle = doneButtonTitle
        self._onDone = onDone
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.rowStylistIdentifier = rowStylistIdentifier
        self.items = dataSource.items

        self.setupDataSourceSubscription(dataSource: dataSource)
        self.setupValidationSubscription()
    }

    public func onDone() {
        let selectedItems = self.selectionMode == .multiple
            ? self.selectedItems
            : Set([self.selectedItem].compactMap {$0})
        self._onDone(selectedItems)
    }

    private func setupValidationSubscription() {
        Publishers.CombineLatest(self.$selectedItems, self.$selectedItem).map { (selectedItems, selectedItem) -> Bool in
            if !self.isRequired {
                return true
            }
            switch self.selectionMode {
            case .multiple:
                return selectedItems.count > 0
            case .single:
                return selectedItem != nil
            }
        }
        .weakAssign(to: \.isValidSelection, on: self)
        .store(in: &self.cancellables)
    }

    private func setupDataSourceSubscription(dataSource: SelectionListDataSource) {
        dataSource.totalItemsPublisher?.assign(to: &self.$totalItems)
        dataSource.selectionPublisher
            .removeDuplicates()
            .sink { selection in
                if self.selectionMode == .multiple {
                    self.selectedItems = selection
                } else {
                    self.selectedItem = selection.first
                }
            }.store(in: &self.cancellables)
        if self.selectionMode == .multiple {
            self.$selectedItems
                .removeDuplicates()
                .receive(on: DispatchQueue.main)
                .sink { newSelection in
                    dataSource.onSelectionChange(selection: newSelection)
                }.store(in: &self.cancellables)
        } else {
            self.$selectedItem
                .removeDuplicates()
                .receive(on: DispatchQueue.main)
                .sink { newSelection in
                    dataSource.onSelectionChange(selection: newSelection.map { [$0] } ?? [])
                }.store(in: &self.cancellables)
        }
    }
}
