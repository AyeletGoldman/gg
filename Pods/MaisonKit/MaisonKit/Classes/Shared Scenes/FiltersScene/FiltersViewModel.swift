// Copyright © 2020 LVMH. All rights reserved.

import Combine

final public class FiltersViewModel: ObservableObject {

    /// Hold the selected filters
    @Published var selectedFilters: SelectedFilters = [:]
    /// Hold filter ids for showing errors
    @Published var errorFilterIds: [FilterID] = []

    @Published var filters: ResultState<[FilterData], ErrorDisplayable> = .waiting

    @Published var totalItems: ResultState<String, ErrorDisplayable> = .waiting

    let title: String
    let doneButtonTitle: String
    let onDismiss: (() -> Void)?
    let shouldShowToolbar: Bool
    private let _onDone: ((SelectedFilters) -> Void)

    private let router: FiltersRouter?
    private var cancellables = Set<AnyCancellable>()

    /// Creates a new `FiltersViewModel`
    /// - Parameters:
    ///   - selectedFilters: the initially-selected filters for the filter view
    ///   - filters: the total available filters in the view that this model represents
    ///   - title: a title to show on the filters screen. Usually displayed in the navigation bar.
    ///   - onDismiss: a closure to invoke when the view this model represents is dismissed without saving the changes. Defaults to `nil`.
    ///   - doneButtonTitle: the title of the done button
    ///   - shouldShowToolbar: whether the view should show the toolbar. Defaults to `false`
    ///   - onDone: a closure to invoke when the user has finished selecting filters. Contains the newly selected filters.
    ///   - router: the router for this viewmodel. Will be used to present nested filter scene.
    public init(selectedFilters: SelectedFilters,
                filters: ResultState<[FilterData], ErrorDisplayable>,
                title: String,
                onDismiss: (() -> Void)? = nil,
                doneButtonTitle: String,
                shouldShowToolbar: Bool = false,
                onDone: @escaping (SelectedFilters) -> Void,
                router: FiltersRouter? = nil) {
        self.selectedFilters = selectedFilters
        self.filters = filters
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onDismiss = onDismiss
        self.shouldShowToolbar = shouldShowToolbar
        self._onDone = onDone
        self.router = router
    }

    /// Creates a new `FiltersViewModel`
    /// - Parameters:
    ///   - dataSource: the filters binding data source
    ///   - title: a title to show on the filters screen. Usually displayed in the navigation bar.
    ///   - onDismiss: a closure to invoke when the view this model represents is dismissed without saving the changes. Defaults to `nil`.
    ///   - doneButtonTitle: the title of the done button
    ///   - shouldShowToolbar: whether the view should show the toolbar. Defaults to `false`
    ///   - onDone: a closure to invoke when the user has finished selecting filters. Contains the newly selected filters.
    ///   - router: the router for this viewmodel. Will be used to present nested filter scene.
    public init(dataSource: FiltersDataSource,
                title: String,
                onDismiss: (() -> Void)? = nil,
                doneButtonTitle: String,
                shouldShowToolbar: Bool = false,
                onDone: @escaping (SelectedFilters) -> Void,
                router: FiltersRouter? = nil) {
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onDismiss = onDismiss
        self.shouldShowToolbar = shouldShowToolbar
        self._onDone = onDone
        self.router = router

        dataSource.filtersPublisher.assign(to: &self.$filters)
        dataSource.totalItemsPublisher?.assign(to: &self.$totalItems)
        dataSource.selectedFiltersPublisher
            .removeDuplicates()
            .assign(to: &self.$selectedFilters)

        self.$selectedFilters
            .removeDuplicates()
            // Filter out selections that don't have any values
            .map { dictionary in
                dictionary.filter { !$0.value.isEmpty }
            }
            .receive(on: DispatchQueue.main)
            .sink { selectedFilters in
                dataSource.onSelectedFiltersChange(selectedFilters: selectedFilters)
            }.store(in: &self.cancellables)
    }

    func presentFilterDetails(scene: AnyScene) {
        self.router?.presentFilterDetails(scene: scene)
    }

    func onDone() {
        self._onDone(self.selectedFilters)
    }
}
