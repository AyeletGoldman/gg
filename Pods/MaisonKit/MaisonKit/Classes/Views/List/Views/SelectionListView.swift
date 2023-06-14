// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

enum SelectionStyle {
    case single
    case multiple
}

/// A selectable list of items. List selection can be multi-select or single-select,
/// depending on whether you initialize this view with a binding to a Set or an Optional item.
/// The selection UI is triggered by the `editMode` environment property. Set it to `.active`
/// to view the selection indicators.
public struct SelectionListView<Item: Identifiable,
                                Content: View,
                                HeaderContent: View>: View {

    /// These two bindings make the decision on whether we are `.single` or `.multiple`
    /// selection. When using one of the initializers that takes one of these as parameters, the
    /// selection style is set up.
    @Binding private var selectedItems: Set<Item.ID>
    @Binding private var selectedItem: Item.ID?
    private let totalItems: ResultState<String, ErrorDisplayable>

    /// The items in the list
    private let items: [Item]
    /// A closure that will be invoked for each of the items in the list to get the content for that item.
    private let rowContent: (Item) -> Content
    /// A closure that will be invoked for each of the items in the list to get the content for that item.
    private let isRowEnabled: (Item) -> Bool
    /// Content to be shown before all items in the list
    private let headerContent: HeaderContent?
    /// The selection style
    private let selectionStyle: SelectionStyle
    /// The  view model to controll AuxiliaryView when there are no items
    private let emptyViewModel: AuxiliaryViewModel?
    /// Whether to show a bottom toolbar with a clear button or not
    private let shouldShowToolbar: Bool
    /// The stylist identifier group to wrap all the row with
    private let rowStylistIdentifier: (Item) -> String
    /// Whether the selection is required or not.
    private let isRequired: Bool

    /// Controls whether the list is in edit mode or not. If the list is in edit mode,
    /// we will see an accessory indicator on the left to allow selection.
    @Environment(\.editMode) private var editMode
    private var unwrappedEditMode: EditMode {
        return self.editMode?.wrappedValue ?? .inactive
    }

    /// Creates a new *multi-select* SelectionList with the given items and a header.
    /// - Parameters:
    ///   - items: the array of items to pass use when creating each of the views in the list
    ///   - selection: a `Binding` to a set of `Item.ID`.
    ///   - rowStylistIdentifier: the stylist identifier group to wrap all the row with
    ///   - emptyViewModel: a view model to controll AuxiliaryView when there are no items
    ///   - shouldShowToolbar: whether to show a bottom toolbar with a clear button or not
    ///   - isRequired: whether the selection is required or not.
    ///   - headerContent: a closure to create the content that will be presented above the items list.
    ///   - isRowEnabled: A closure that given an `Item` will return whether or not the row is enabled
    ///   - rowContent: a closure to invoke with each of the items in the list that will return the content for that item
    public init(items: [Item],
                selection: Binding<Set<Item.ID>>,
                rowStylistIdentifier: String,
                emptyViewModel: AuxiliaryViewModel? = nil,
                shouldShowToolbar: Bool = false,
                isRequired: Bool = false,
                @ViewBuilder headerContent: () -> HeaderContent,
                isRowEnabled: @escaping (Item) -> Bool = { _ in true },
                rowContent: @escaping (Item) -> Content) {
        self.items = items
        self._selectedItems = selection
        self._selectedItem = .constant(nil)
        self.selectionStyle = .multiple
        self.rowContent = rowContent
        self.headerContent = headerContent()
        self.emptyViewModel = emptyViewModel
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.rowStylistIdentifier = { _ in rowStylistIdentifier }
        self.isRowEnabled = isRowEnabled
        self.totalItems = .waiting
    }

    /// Creates a new *multi-select* SelectionList with the given items and a header.
    /// - Parameters:
    ///   - items: the array of items to pass use when creating each of the views in the list
    ///   - selection: a `Binding` to a set of `Item.ID`.
    ///   - rowStylistIdentifier: a cloure which, given the item in the row returns the stylist identifier group to wrap all the row with
    ///   - emptyViewModel: a view model to controll AuxiliaryView when there are no items
    ///   - shouldShowToolbar: whether to show a bottom toolbar with a clear button or not
    ///   - isRequired: whether the selection is required or not.
    ///   - headerContent: a closure to create the content that will be presented above the items list.
    ///   - isRowEnabled: A closure that given an `Item` will return whether or not the row is enabled
    ///   - rowContent: a closure to invoke with each of the items in the list that will return the content for that item
    public init(items: [Item],
                selection: Binding<Set<Item.ID>>,
                rowStylistIdentifier: @escaping (Item) -> String,
                emptyViewModel: AuxiliaryViewModel? = nil,
                shouldShowToolbar: Bool = false,
                isRequired: Bool = false,
                @ViewBuilder headerContent: () -> HeaderContent,
                isRowEnabled: @escaping (Item) -> Bool = { _ in true },
                rowContent: @escaping (Item) -> Content) {
        self.items = items
        self._selectedItems = selection
        self._selectedItem = .constant(nil)
        self.selectionStyle = .multiple
        self.rowContent = rowContent
        self.headerContent = headerContent()
        self.emptyViewModel = emptyViewModel
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.rowStylistIdentifier = rowStylistIdentifier
        self.isRowEnabled = isRowEnabled
        self.totalItems = .waiting
    }

    /// Creates a new *single-select* SelectionList with the given items and a header.
    /// - Parameters:
    ///   - items: the array of items to pass use when creating each of the views in the list
    ///   - selection: a `Binding` to an `Item.ID?`.
    ///   - rowStylistIdentifier: the stylist identifier group to wrap all the row with
    ///   - emptyViewModel: a view model to controll AuxiliaryView when there are no items
    ///   - shouldShowToolbar: whether to show a bottom toolbar with a clear button or not
    ///   - isRequired: whether the selection is required or not.
    ///   - headerContent: a closure to create the content that will be presented above the items list.
    ///   - isRowEnabled: A closure that given an `Item` will return whether or not the row is enabled
    ///   - rowContent: a closure to invoke with each of the items in the list that will return the content for that item
    public init(items: [Item],
                selection: Binding<Item.ID?>,
                rowStylistIdentifier: String,
                emptyViewModel: AuxiliaryViewModel? = nil,
                shouldShowToolbar: Bool = false,
                isRequired: Bool = false,
                @ViewBuilder headerContent: () -> HeaderContent,
                isRowEnabled: @escaping (Item) -> Bool = { _ in true },
                rowContent: @escaping (Item) -> Content) {
        self.items = items
        self._selectedItems = .constant([])
        self._selectedItem = selection
        self.selectionStyle = .single
        self.rowContent = rowContent
        self.headerContent = headerContent()
        self.emptyViewModel = emptyViewModel
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.rowStylistIdentifier = { _ in rowStylistIdentifier }
        self.isRowEnabled = isRowEnabled
        self.totalItems = .waiting
    }

    /// Creates a new *single-select* SelectionList with the given items and a header.
    /// - Parameters:
    ///   - items: the array of items to pass use when creating each of the views in the list
    ///   - selection: a `Binding` to an `Item.ID?`.
    ///   - rowStylistIdentifier: a cloure which, given the item in the row returns the stylist identifier group to wrap all the row with
    ///   - emptyViewModel: a view model to controll AuxiliaryView when there are no items
    ///   - shouldShowToolbar: whether to show a bottom toolbar with a clear button or not
    ///   - isRequired: whether the selection is required or not.
    ///   - headerContent: a closure to create the content that will be presented above the items list.
    ///   - isRowEnabled: A closure that given an `Item` will return whether or not the row is enabled
    ///   - rowContent: a closure to invoke with each of the items in the list that will return the content for that item
    public init(items: [Item],
                selection: Binding<Item.ID?>,
                rowStylistIdentifier: @escaping (Item) -> String,
                emptyViewModel: AuxiliaryViewModel? = nil,
                shouldShowToolbar: Bool = false,
                isRequired: Bool = false,
                @ViewBuilder headerContent: () -> HeaderContent,
                isRowEnabled: @escaping (Item) -> Bool = { _ in true },
                rowContent: @escaping (Item) -> Content) {
        self.items = items
        self._selectedItems = .constant([])
        self._selectedItem = selection
        self.selectionStyle = .single
        self.rowContent = rowContent
        self.headerContent = headerContent()
        self.emptyViewModel = emptyViewModel
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.rowStylistIdentifier = rowStylistIdentifier
        self.isRowEnabled = isRowEnabled
        self.totalItems = .waiting
    }

    public var body: some View {
        MKList {
            if let header = self.headerContent {
                header
            }
            if self.items.isEmpty, let emptyViewModel = self.emptyViewModel {
                AuxiliaryView(viewModel: emptyViewModel)
                    .padding(.vertical)
            } else {
                ForEach(self.items) { item in
                    self.buildContent(for: item)
                }
            }
        }
        .addToolbar(shouldShow: self.shouldShowToolbar, toolbarVariant: nil, clearTitle: SelectionListLabels.clearButtonTitle, onClear: {
            switch self.selectionStyle {
            case .multiple:
                if !self.isRequired || self.selectedItems.count > 1 {
                    self.selectedItems = []
                }
            case .single:
                if !self.isRequired {
                    self.selectedItem = nil
                }
            }
        }, trailingTitle: self.totalItems)
        .style("background")
    }

    // Builds each of the content rows, adding the selection view if we're in
    // edit mode and setting the item as selected if necessary.
    // It also wraps the view in a tap gesture that will handle taps for selection.
    private func buildContent(for item: Item) -> some View {
        self.rowContent(item)
            .modifiedListItem(editMode: self.unwrappedEditMode,
                              isSelected: self.isItemSelected(item),
                              selectionStyle: self.selectionStyle)
            .contentShape(Rectangle()) // So the full row will be tappable
            .conditionalTapGesture(editMode: self.unwrappedEditMode) {
                self.handleSelection(with: item)
            }
            .styleRow(stylistIdentifier: self.rowStylistIdentifier(item), includeDivider: true)
            .disabled(!self.isRowEnabled(item))
    }

    // Returns whether an item is selected
    private func isItemSelected(_ item: Item) -> Bool {
        switch self.selectionStyle {
        case .multiple:
            return self.selectedItems.contains(item.id)
        case .single:
            return self.selectedItem == item.id
        }
    }

    // Handles taps on an item to select or un-select it.
    private func handleSelection(with item: Item) {
        switch self.selectionStyle {
        case .multiple:
            if self.selectedItems.contains(item.id) {
                if !self.isRequired || self.selectedItems.count > 1 {
                    self.selectedItems.remove(item.id)
                }
            } else {
                self.selectedItems.insert(item.id)
            }
        case .single:
            self.selectedItem = item.id
        }
    }
}

/// A convenience extension to allow SelectionList to be created without the need to specify a type for the
/// `HeaderContent`. Practically, this means the compiler is able to reason about the initializers in this
/// extension without having to care about the HeaderContent concrete type.
public extension SelectionListView where HeaderContent == Never {
    /// A convenience initializer to create a *multi-select* `SelectionList` without any HeaderContent
    /// - Parameters:
    ///   - items: the array of items to pass use when creating each of the views in the list
    ///   - selection: a `Binding` to a set of `Item.ID`.
    ///   - rowStylistIdentifier: a cloure which, given the item in the row returns the stylist identifier group to wrap all the row with
    ///   - emptyViewModel: a view model to controll AuxiliaryView when there are no items
    ///   - shouldShowToolbar: whether to show a bottom toolbar with a clear button or not
    ///   - isRequired: whether the selection is required or not.
    ///   - isRowEnabled: A closure that given an `Item` will return whether or not the row is enabled
    ///   - rowContent: a closure to invoke with each of the items in the list that will return the content for that item
    init(items: [Item],
         selection: Binding<Set<Item.ID>>,
         rowStylistIdentifier: String,
         emptyViewModel: AuxiliaryViewModel? = nil,
         shouldShowToolbar: Bool = false,
         isRequired: Bool = false,
         isRowEnabled: @escaping (Item) -> Bool = { _ in true },
         rowContent: @escaping (Item) -> Content) {
        self.items = items
        self._selectedItems = selection
        self._selectedItem = .constant(nil)
        self.selectionStyle = .multiple
        self.rowContent = rowContent
        self.headerContent = nil
        self.emptyViewModel = emptyViewModel
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.totalItems = .waiting
        self.rowStylistIdentifier = { _ in rowStylistIdentifier }
        self.isRowEnabled = isRowEnabled
    }

    /// A convenience initializer to create a *multi-select* `SelectionList` without any HeaderContent
    /// - Parameters:
    ///   - items: the array of items to pass use when creating each of the views in the list
    ///   - selection: a `Binding` to a set of `Item.ID`.
    ///   - rowStylistIdentifier: a cloure which, given the item in the row returns the stylist identifier group to wrap all the row with
    ///   - emptyViewModel: a view model to controll AuxiliaryView when there are no items
    ///   - shouldShowToolbar: whether to show a bottom toolbar with a clear button or not
    ///   - isRequired: whether the selection is required or not.
    ///   - totalItems: the result state total items title to present in the footer toolbar
    ///   - isRowEnabled: A closure that given an `Item` will return whether or not the row is enabled
    ///   - rowContent: a closure to invoke with each of the items in the list that will return the content for that item
    init(items: [Item],
         selection: Binding<Set<Item.ID>>,
         rowStylistIdentifier: @escaping (Item) -> String,
         emptyViewModel: AuxiliaryViewModel? = nil,
         shouldShowToolbar: Bool = false,
         isRequired: Bool = false,
         totalItems: ResultState<String, ErrorDisplayable> = .waiting,
         isRowEnabled: @escaping (Item) -> Bool = { _ in true },
         rowContent: @escaping (Item) -> Content) {
        self.items = items
        self._selectedItems = selection
        self._selectedItem = .constant(nil)
        self.selectionStyle = .multiple
        self.rowContent = rowContent
        self.headerContent = nil
        self.emptyViewModel = emptyViewModel
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.totalItems = totalItems
        self.rowStylistIdentifier = rowStylistIdentifier
        self.isRowEnabled = isRowEnabled
    }

    /// A convenience initializer to create a *single-select* `SelectionList` without any HeaderContent
    /// - Parameters:
    ///   - items: the array of items to pass use when creating each of the views in the list
    ///   - selection: a `Binding` to an `Item.ID?`.
    ///   - rowStylistIdentifier: the stylist identifier group to wrap all the row with
    ///   - emptyViewModel: a view model to controll AuxiliaryView when there are no items
    ///   - shouldShowToolbar: whether to show a bottom toolbar with a clear button or not
    ///   - isRequired: whether the selection is required or not.
    ///   - isRowEnabled: A closure that given an `Item` will return whether or not the row is enabled
    ///   - rowContent: a closure to invoke with each of the items in the list that will return the content for that item
    init(items: [Item],
         selection: Binding<Item.ID?>,
         rowStylistIdentifier: String,
         emptyViewModel: AuxiliaryViewModel? = nil,
         shouldShowToolbar: Bool = false,
         isRequired: Bool = false,
         isRowEnabled: @escaping (Item) -> Bool = { _ in true },
         rowContent: @escaping (Item) -> Content) {
        self.items = items
        self._selectedItems = .constant([])
        self._selectedItem = selection
        self.selectionStyle = .single
        self.rowContent = rowContent
        self.headerContent = nil
        self.emptyViewModel = emptyViewModel
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.rowStylistIdentifier = { _ in rowStylistIdentifier }
        self.isRowEnabled = isRowEnabled
        self.totalItems = .waiting
    }

    /// A convenience initializer to create a *single-select* `SelectionList` without any HeaderContent
    /// - Parameters:
    ///   - items: the array of items to pass use when creating each of the views in the list
    ///   - selection: a `Binding` to a set of `Item.ID`.
    ///   - rowStylistIdentifier: the stylist identifier group to wrap all the row with
    ///   - emptyViewModel: a view model to controll AuxiliaryView when there are no items
    ///   - shouldShowToolbar: whether to show a bottom toolbar with a clear button or not
    ///   - isRequired: whether the selection is required or not.
    ///   - totalItems: the result state total items title to present in the footer toolbar
    ///   - isRowEnabled: A closure that given an `Item` will return whether or not the row is enabled
    ///   - rowContent: a closure to invoke with each of the items in the list that will return the content for that item
    init(items: [Item],
         selection: Binding<Item.ID?>,
         rowStylistIdentifier: @escaping (Item) -> String,
         emptyViewModel: AuxiliaryViewModel? = nil,
         shouldShowToolbar: Bool = false,
         isRequired: Bool = false,
         totalItems: ResultState<String, ErrorDisplayable> = .waiting,
         isRowEnabled: @escaping (Item) -> Bool = { _ in true },
         rowContent: @escaping (Item) -> Content) {
        self.items = items
        self._selectedItems = .constant([])
        self._selectedItem = selection
        self.selectionStyle = .single
        self.rowContent = rowContent
        self.headerContent = nil
        self.emptyViewModel = emptyViewModel
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.totalItems = totalItems
        self.rowStylistIdentifier = rowStylistIdentifier
        self.isRowEnabled = isRowEnabled
    }
}

private extension View {
    @ViewBuilder
    func modifiedListItem(editMode: EditMode, isSelected: Bool, selectionStyle: SelectionStyle) -> some View {
        if editMode == .active {
            self.modifier(ListItemSelectionModifier(selected: isSelected, selectionStyle: selectionStyle))
        } else {
            self
        }
    }

    @ViewBuilder
    func conditionalTapGesture(editMode: EditMode, action: @escaping () -> Void) -> some View {
        if editMode == .active {
            self.simultaneousGesture(TapGesture().onEnded(action))
        } else {
            self
        }
    }
}

private enum SelectionListLabels {
    static let clearButtonTitle = MKLocalizedString("selection.clear.button.title",
                                                    comment: "The title for clear selection button")
}
