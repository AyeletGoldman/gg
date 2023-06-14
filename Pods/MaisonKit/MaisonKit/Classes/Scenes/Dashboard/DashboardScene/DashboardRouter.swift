// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A router for the dashboard scene
public protocol DashboardRouter {

    /// Presents the dashboard's filters
    /// - Parameters:
    ///   - selectedFilters: a set of selected filters to display on the filters scene. This is a subset of the `filters`.
    ///   - filters: a set of filters that are available to be selected. This is a superset of `selectedFilters`.
    ///   - onDone: a closure to call when the user has finished selecting filters with the list of newly selected filters.
    func presentFilters(selectedFilters: SelectedFilters,
                        filters: [FilterData],
                        onDone: @escaping (SelectedFilters) -> Void)
}

final class DefaultDashboardRouter: Router<DashboardViewController>, DashboardRouter {

    private enum Labels {
        static let dashboardFiltersTitle = MKLocalizedString("dashboard.filters.title", comment: "The title for the dashboard filters")
        static let dashboardFiltersDoneButtonTitle = MKLocalizedString("dashboard.filters.done",
                                                                       comment: "The title for the dashboard filters done button")
    }

    func presentFilters(selectedFilters: SelectedFilters,
                        filters: [FilterData],
                        onDone: @escaping (SelectedFilters) -> Void) {
        let scene = self.factory.retrieveScene(with: DashboardFiltersRouteDescriptor(
            selectedFilters: selectedFilters,
            filters: filters,
            title: Labels.dashboardFiltersTitle,
            onDismiss: { controllerToDismiss in
                controllerToDismiss.dismiss(animated: true, completion: nil)
            },
            doneButtonTitle: Labels.dashboardFiltersDoneButtonTitle,
            shouldShowToolbar: true,
            onDone: { controllerToDismiss, criteria in
                onDone(criteria)
                controllerToDismiss.dismiss(animated: true, completion: nil)
            }
        ))

        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
