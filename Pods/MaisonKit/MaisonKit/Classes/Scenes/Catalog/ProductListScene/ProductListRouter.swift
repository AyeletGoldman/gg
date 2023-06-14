// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The router for the product list scene
public protocol ProductListRouter: CuratorPresenterRouter, BarcodeScannerPresenterRouter {

    /// Presents the product details screen with the given context
    /// - Parameter context: an initialisation context for the product details screen.
    func presentProductDetails(context: ProductDetailsInitialisationContext)

    /// Presents the product sort scene
    /// - Parameters:
    ///   - sortItems: a set of sort criteria that will be available for sorting
    ///   - selectedSortValue: _optional_ an initial sort value that should be selected. This value should be part of `sortItems`.
    ///   - onDone: a closure to invoke with the selected sort item, if any.
    func presentProductSort(sortItems: [SortItem], selectedSortValue: SelectedSortValue?, onDone: @escaping (String?) -> Void)

    /// Presents the product filter scene
    /// - Parameters:
    ///   - dataSource: The data source to use for the filters. This is an object that defines the data and behaviour of the filters.
    ///   Think of it as a combination of a data source and a delegate.
    ///   - onCancel: a closure to invoke when the user tap to cancel selecting filters.
    func presentProductFilters(dataSource: FiltersDataSource,
                               onCancel: @escaping () -> Void)
}

final class DefaultProductListRouter: Router<ProductListViewController>, ProductListRouter, DefaultCuratorPresenterRouter, DefaultBarcodeScannerPresenterRouter {

    private enum Labels {
        static let filterTitle = MKLocalizedString("product-list.toolbar.filter.title",
                                                   comment: "The text to show for the filter button in product lists")
        static let filterDoneTitle = MKLocalizedString("product-list.filter.done.title",
                                                       comment: "The text to show for the filter done button in product lists")
        static let sortTitle = MKLocalizedString("product-list.toolbar.sort.title",
                                                 comment: "The text to show for the sort button in product lists")
        static let sortDoneTitle = MKLocalizedString("product-list.sort.done.title",
                                                     comment: "The text to show for the sort done button in product lists")
    }

    func presentProductDetails(context: ProductDetailsInitialisationContext) {
        let scene = self.factory.retrieveScene(with: ProductDetailsRouteDescriptor(context: context))
        let controller = self.factory.createViewController(scene)
        self.push(controller)
    }

    func presentProductSort(sortItems: [SortItem],
                            selectedSortValue: SelectedSortValue?,
                            onDone: @escaping (String?) -> Void) {
        let descriptor = ProductSortRouteDescriptor(selectedSort: selectedSortValue,
                                                    availableSortCriteria: sortItems,
                                                    title: Labels.sortTitle,
                                                    doneButtonTitle: Labels.sortDoneTitle,
                                                    shouldShowToolbar: false,
                                                    onDismiss: { controller in
                                                        controller.dismiss(animated: true, completion: nil)
                                                    }, onDone: { controller, selectedSortValue in
                                                        controller.dismiss(animated: true, completion: nil)
                                                        onDone(selectedSortValue)
                                                    })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }

    func presentProductFilters(dataSource: FiltersDataSource,
                               onCancel: @escaping () -> Void) {
        let descriptor = ProductFiltersRouteDescriptor(
            dataSource: dataSource,
            title: Labels.filterTitle,
            onDismiss: { controller in
                controller.dismiss(animated: true, completion: nil)
                onCancel()
            },
            doneButtonTitle: Labels.filterDoneTitle,
            shouldShowToolbar: true,
            onDone: { controller, _ in
                controller.dismiss(animated: true, completion: nil)
            })
        let scene = self.factory.retrieveScene(with: descriptor)
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
