// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import Biodag

/// The viewmodel that manages a `DashboardView`
/// In MaisonKit, this view model is responsible for showing the correct state for the dashboard.
/// It requests the data from a `DashboardAdapter` and makes it available to the `DashboardView` via the `dashboardRows` property.
public final class DashboardViewModel: ObservableObject {

    @Published private(set) var dashboardRows: ResultState<[any StatItemDisplayView], ErrorDisplayable> = .waiting
    @Published private(set) var filters: ResultState<[FilterData], ErrorDisplayable> = .waiting
    @Published var selectedFilters: SelectedFilters = [:]

    var title: String?
    private var refreshTask: Task<DashboardDisplayable, Error>?
    private var fetchTask: Task<Void, Never>?

    @Inject private var dashboardAdapter: DashboardAdapter
    private let router: DashboardRouter

    var hasFilters: Bool {
        self.filters.isSuccess && self.filters.value?.isEmpty == false
    }

    /// Creates a new `DashboardViewModel`
    /// - Parameter router: the router to use to handle presenting new scenes
    public init(router: DashboardRouter) {
        self.router = router
    }

    @MainActor
    private func handleAdapterResult(_ result: Result<DashboardDisplayable, ErrorDisplayable>) {
        switch result {
        case .failure(let error):
            self.dashboardRows = .failed(error)
            self.filters = .failed(error)
        case .success(let displayable):
            self.dashboardRows = .found(displayable.items)
            self.selectedFilters = displayable.selectedFilters
            self.filters = .found(displayable.filters)
            self.title = displayable.title
        }
    }

    func presentFilters() {
        guard let filters = self.filters.value else { return }
        self.router.presentFilters(selectedFilters: self.selectedFilters,
                                   filters: filters,
                                   onDone: self.filterDashboard)
    }

    private func filterDashboard(selectedFilters: SelectedFilters) {
        self.selectedFilters = selectedFilters
        self.listenToDashboardChanges()
    }

    func getToolbarTitle() -> String {
        guard let filters = self.filters.value else {
            return ""
        }
        let selectedFilterTitles: [String] = filters.compactMap { filter -> String? in
            guard let selectedFilterValues = self.selectedFilters[filter.viewBuilder.filterId] else {
                return nil
            }
            return filter.getDisplayButtonText(selectedValues: selectedFilterValues)
        }
        return selectedFilterTitles.joined(separator: ", ")
    }
}

// Fetch & listen for data
extension DashboardViewModel {
    func fetchDashboard() {
        guard self.dashboardRows.isWaiting || self.dashboardRows.isFailed else {
            return
        }
        self.listenToDashboardChanges()
    }

    @MainActor
    func refreshDashboard() async {
        guard let userId = MaisonKitUser.currentLoggedInUser?.id else {
            return
        }
        let publisher = self.dashboardAdapter.getDashboardItems(userId: userId, filters: self.selectedFilters)
        let task = Task {
            return try await publisher.getResultAsync()
        }
        self.refreshTask = task
        let result = await task.result.mapError { ErrorDisplayable($0) }
        self.handleAdapterResult(result)
    }

    private func listenToDashboardChanges() {
        guard let userId = MaisonKitUser.currentLoggedInUser?.id else {
            return
        }

        self.dashboardRows = .loading(nil)
        let stream = self.dashboardAdapter.getDashboardItems(userId: userId, filters: self.selectedFilters).values
        let task = Task { [weak self] in
            do {
                for try await result in stream {
                    await self?.handleAdapterResult(result)
                }
            } catch {
                await self?.handleAdapterResult(.failure(ErrorDisplayable(error)))
            }
        }
        self.fetchTask = task
    }
}
