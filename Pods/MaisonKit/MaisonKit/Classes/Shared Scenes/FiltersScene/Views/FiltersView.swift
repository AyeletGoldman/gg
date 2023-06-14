// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI
import Combine

public struct FiltersView: View {

    private enum Labels {
        static let clearFiltersButtonTitle = MKLocalizedString("filters.clear.button.title",
                                                               comment: "The title for clear filters button")
    }

    /// Hold the selected filters
    @Binding private var selectedFilters: SelectedFilters
    /// Hold filter ids for showing errors
    @Binding private var errorFilterIds: [FilterID]

    @State private var totalItemsTitle: ResultState<String, ErrorDisplayable>?
    /// Hold the result state trailing title
    private var totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>

    private let filters: ResultState<[FilterData], ErrorDisplayable>
    private let shouldShowToolbar: Bool
    private let presentFilterDetails: (AnyScene) -> Void

    /// Creates a new `FilterView`
    /// - Parameters:
    ///   - selectedFilters: the initially-selected filters for the filter view
    ///   - filters: the total available filters in the view that this model represents
    ///   - errorFilterIds: the error filter ids to show a different style for these filter titles
    ///   - shouldShowToolbar: whether the view should show the toolbar. Defaults to `false`.
    ///   - presentFilterDetails: a closure that takes a `Scene` and is used to present the details for this view.
    ///   - totalItems: The total items result state to show.
    public init(selectedFilters: Binding<SelectedFilters>,
                filters: ResultState<[FilterData], ErrorDisplayable>,
                errorFilterIds: Binding<[FilterID]> = .constant([]),
                shouldShowToolbar: Bool = false,
                presentFilterDetails: @escaping (AnyScene) -> Void,
                totalItems: AnyPublisher<ResultState<String, ErrorDisplayable>, Never>) {
        self._selectedFilters = selectedFilters
        self.filters = filters
        self._errorFilterIds = errorFilterIds
        self.shouldShowToolbar = shouldShowToolbar
        self.presentFilterDetails = presentFilterDetails
        self.totalItems = totalItems
    }

    public var body: some View {
        ResultStateViewBuilder(result: self.filters)
            .setLoadingView { data in
                // We have 2 loading states here.
                // If we have data, we show a small spinner in the top left while we retrieve the new results
                // If we don't have any data, then we show a skeleton
                if let data = data {
                    self.buildMainView(filters: data).unredacted()
                } else {
                    self.buildMainView(filters: FilterData.loadingItems)
                }
            }
            .setEmptyView {
                AuxiliaryView(viewModel: AuxiliaryViewModel(displayableError: .emptyResult))
            }
            .buildContent(self.buildMainView)
            .style("background")
    }

    @ViewBuilder
    private func buildMainView(filters: [FilterData]) -> some View {
        self.buildFilters(filters: filters)
            .addToolbar(shouldShow: self.shouldShowToolbar,
                        toolbarVariant: "filters",
                        clearTitle: Labels.clearFiltersButtonTitle,
                        onClear: { self.selectedFilters = [:] },
                        trailingTitle: self.totalItemsTitle)
            .style("background")
            .onReceive(self.totalItems, perform: {
                self.totalItemsTitle = $0
            })
    }

    @ViewBuilder
    private func buildFilters(filters: [FilterData]) -> some View {
        ScrollView {
            // This should probably be a `LazyVStack` but there is an odd
            // "jump" that happens when overscrolling. It appears to be fixed
            // by using a regular VStack. Since we don't expect there to be hundreds
            // of items in this stack, it's probably fine to have a VStack.
            // See: https://lvmh-maisons.atlassian.net/browse/MM-26
            VStack(spacing: 20) {
                ForEach(filters, id: \.viewBuilder.filterId) { filter in
                    self.buildFilter(filter: filter)
                }
            }
            .padding(.vertical, 20)
        }
    }

    @ViewBuilder
    private func buildFilter(filter: FilterData) -> some View {
        VStack(spacing: 6) {
            SectionHeaderView(title: filter.title)
                .addStyledRowDivider()
                .padding(.horizontal)
            filter.viewBuilder.makeBody(selectedItems: self.$selectedFilters,
                                        totalItems: self.totalItems,
                                        onSelectedPresent: self.presentFilterDetails)
        }
    }
}

private extension FilterData {
    static var loadingItems: [FilterData] = Array(
        repeating: FilterData(title: "Title",
                              pluralTitleFormat: "",
                              viewBuilder: .textFilter(TextFilter(id: UUID().uuidString,
                                                                  filterItems: [TextFilterView.Item(displayName: "displayName",
                                                                                                    value: UUID().uuidString),
                                                                                TextFilterView.Item(displayName: "displayName",
                                                                                                    value: UUID().uuidString),
                                                                                TextFilterView.Item(displayName: "displayName",
                                                                                                    value: UUID().uuidString),
                                                                                TextFilterView.Item(displayName: "displayName",
                                                                                                    value: UUID().uuidString)]))),
        count: 5)
}
