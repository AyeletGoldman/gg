// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

struct FiltersScene: Scene {

    private let dataSource: FiltersDataSource
    private let title: String
    private let onDismiss: ((UIViewController) -> Void)?
    private let doneButtonTitle: String
    private let shouldShowToolbar: Bool
    private let onDone: (UIViewController, SelectedFilters) -> Void

    init(dataSource: FiltersDataSource,
         title: String,
         onDismiss: ((UIViewController) -> Void)? = nil,
         doneButtonTitle: String,
         shouldShowToolbar: Bool = false,
         onDone: @escaping (UIViewController, SelectedFilters) -> Void) {
        self.dataSource = dataSource
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onDismiss = onDismiss
        self.shouldShowToolbar = shouldShowToolbar
        self.onDone = onDone
    }

    func createViewController() -> FiltersViewController {
        return FiltersViewController()
    }

    func configure(controller: FiltersViewController,
                   using factory: SceneFactory) {
        let router = DefaultFiltersRouter(controller: controller, factory: factory)
        let viewModel = FiltersViewModel(dataSource: self.dataSource,
                                         title: self.title,
                                         onDismiss: self.onDismiss.map { onDismissFunc in { [weak controller] in
            guard let controller else { return }
            onDismissFunc(controller)
        }},
                                         doneButtonTitle: self.doneButtonTitle,
                                         shouldShowToolbar: self.shouldShowToolbar,
                                         onDone: { [weak controller] criteria in
            guard let controller else { return }
            self.onDone(controller, criteria)
        },
                                         router: router)
        controller.viewModel = viewModel
    }
}

extension FiltersScene {
    init(selectedFilters: SelectedFilters,
         filters: [FilterData],
         title: String,
         onDismiss: ((UIViewController) -> Void)? = nil,
         doneButtonTitle: String,
         shouldShowToolbar: Bool = false,
         onDone: @escaping (UIViewController, SelectedFilters) -> Void) {
        self.dataSource = DefaultFiltersDataSource(
            filtersPublisher: Just(.found(filters)).eraseToAnyPublisher(),
            selectedFiltersPublisher: Just(selectedFilters).eraseToAnyPublisher(),
            totalItemsPublisher: nil)
        self.title = title
        self.doneButtonTitle = doneButtonTitle
        self.onDismiss = onDismiss
        self.shouldShowToolbar = shouldShowToolbar
        self.onDone = onDone
    }
}
