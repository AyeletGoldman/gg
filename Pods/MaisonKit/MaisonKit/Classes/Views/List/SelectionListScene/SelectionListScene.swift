// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

public struct SelectionListScene: Scene {

    /// The selection list binded datasource
    private let dataSource: SelectionListDataSource
    /// The selection mode, whether it's single or multiple selection.
    private let selectionMode: SelectionMode
    /// The title of the scene. Usually shown in the navigation bar.
    private let title: String
    /// Optional. A closure to invoke when the user wants to dismiss the presented scene.
    private let onDismiss: ((UIViewController) -> Void)?
    /// The title of the done button.
    private let doneButtonTitle: String
    /// A closure to invoke when the user wants to save the new selection.
    private let onDone: (UIViewController, Set<String>) -> Void
    /// Whether to show a bottom toolbar with a clear button or not.
    private let shouldShowToolbar: Bool
    /// Whether the selection is required or not.
    private let isRequired: Bool
    /// A closure that, given a `SelectionListItem` returns a stylist identifier string for each row
    private let rowStylistIdentifier: (SelectionListItem) -> String

    init(dataSource: SelectionListDataSource,
         selectionMode: SelectionMode,
         title: String,
         onDismiss: ((UIViewController) -> Void)? = nil,
         doneButtonTitle: String,
         onDone: @escaping (UIViewController, Set<String>) -> Void,
         shouldShowToolbar: Bool = false,
         isRequired: Bool = false,
         rowStylistIdentifier: @escaping (SelectionListItem) -> String) {
        self.dataSource = dataSource
        self.selectionMode = selectionMode
        self.title = title
        self.onDismiss = onDismiss
        self.doneButtonTitle = doneButtonTitle
        self.onDone = onDone
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.rowStylistIdentifier = rowStylistIdentifier
    }

    init(items: [SelectionListItem],
         selection: Set<String> = [],
         selectionMode: SelectionMode,
         title: String,
         onDismiss: ((UIViewController) -> Void)? = nil,
         doneButtonTitle: String,
         onDone: @escaping (UIViewController, Set<String>) -> Void,
         shouldShowToolbar: Bool = false,
         isRequired: Bool = false,
         rowStylistIdentifier: @escaping (SelectionListItem) -> String) {
        self.dataSource = DefaultSelectionListDataSource(items: items,
                                                         selectionPublisher: Just(selection).eraseToAnyPublisher(),
                                                         totalItemsPublisher: nil)
        self.selectionMode = selectionMode
        self.title = title
        self.onDismiss = onDismiss
        self.doneButtonTitle = doneButtonTitle
        self.onDone = onDone
        self.shouldShowToolbar = shouldShowToolbar
        self.isRequired = isRequired
        self.rowStylistIdentifier = rowStylistIdentifier
    }

    public func createViewController() -> SelectionListViewController {
        return SelectionListViewController()
    }

    public func configure(controller: SelectionListViewController, using factory: SceneFactory) {
        let viewModel = SelectionListViewModel(
            dataSource: self.dataSource,
            selectionMode: self.selectionMode,
            title: self.title,
            onDismiss: self.onDismiss.map { [weak controller] onDismissFunc in {
                guard let controller = controller else { return }
                onDismissFunc(controller)
            }},
            doneButtonTitle: self.doneButtonTitle,
            onDone: { [weak controller] criteria in
                guard let controller = controller else { return }
                self.onDone(controller, criteria)
            },
            shouldShowToolbar: self.shouldShowToolbar,
            isRequired: self.isRequired,
            rowStylistIdentifier: self.rowStylistIdentifier
        )
        controller.viewModel = viewModel
    }
}

public extension SelectionListScene {

    /// Creates a new `SelectionListScene` for single selection.
    /// - Parameters:
    ///   - items: The items in the selection list.
    ///   - selection: Optional. The default selection ID.
    ///   - title: The title of the scene. Usually shown in the navigation bar.
    ///   - onDismiss: Optional. A closure to invoke when the user wants to dismiss the presented scene.
    ///   - doneButtonTitle: The title of the done button.
    ///   - onDone: A closure to invoke when the user wants to save the new selection.
    ///   - shouldShowToolbar: Whether to show a bottom toolbar with a clear button or not.
    ///   - isRequired: Whether the selection is required or not.
    ///   - rowStylistIdentifier: A closure that, given a `SelectionListItem` returns a stylist identifier string for each row
    /// - Returns: A `SelectionListScene` for single selection.
    static func singleSelectionListScene(items: [SelectionListItem],
                                         selection: String?,
                                         title: String,
                                         onDismiss: ((UIViewController) -> Void)? = nil,
                                         doneButtonTitle: String,
                                         onDone: @escaping (UIViewController, String?) -> Void,
                                         shouldShowToolbar: Bool = false,
                                         isRequired: Bool = false,
                                         rowStylistIdentifier: @escaping (SelectionListItem) -> String = { _ in "input" }) -> SelectionListScene {
        return SelectionListScene(items: items,
                                  selection: selection.map { [$0] } ?? [],
                                  selectionMode: .single,
                                  title: title,
                                  onDismiss: onDismiss,
                                  doneButtonTitle: doneButtonTitle,
                                  onDone: { controller, selection in
            onDone(controller, selection.first)
        },
                                  shouldShowToolbar: shouldShowToolbar,
                                  isRequired: isRequired,
                                  rowStylistIdentifier: rowStylistIdentifier)
    }

    /// Creates a new `SelectionListScene` for multiple selection.
    /// - Parameters:
    ///   - items: The items in the selection list.
    ///   - selection: Optional. The default selection IDs.
    ///   - title: The title of the scene. Usually shown in the navigation bar.
    ///   - onDismiss: Optional. A closure to invoke when the user wants to dismiss the presented scene.
    ///   - doneButtonTitle: The title of the done button.
    ///   - onDone: A closure to invoke when the user wants to save the new selection.
    ///   - shouldShowToolbar: Whether to show a bottom toolbar with a clear button or not.
    ///   - isRequired: Whether the selection is required or not.
    ///   - rowStylistIdentifier: A closure that, given a `SelectionListItem` returns a stylist identifier string for each row
    /// - Returns: A `SelectionListScene` for multiple selection.
    static func multipleSelectionlistScene(items: [SelectionListItem],
                                           selection: Set<String> = [],
                                           title: String,
                                           onDismiss: ((UIViewController) -> Void)? = nil,
                                           doneButtonTitle: String,
                                           onDone: @escaping (UIViewController, Set<String>) -> Void,
                                           shouldShowToolbar: Bool = false,
                                           isRequired: Bool = false,
                                           rowStylistIdentifier: @escaping (SelectionListItem) -> String = { _ in "input" }) -> SelectionListScene {
        return SelectionListScene(items: items,
                                  selection: selection,
                                  selectionMode: .multiple,
                                  title: title,
                                  onDismiss: onDismiss,
                                  doneButtonTitle: doneButtonTitle,
                                  onDone: onDone,
                                  shouldShowToolbar: shouldShowToolbar,
                                  isRequired: isRequired,
                                  rowStylistIdentifier: rowStylistIdentifier)
    }

}
