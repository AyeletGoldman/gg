// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct ProductListSceneView: View {

    private enum Labels {
        static let emptyTitle = MKLocalizedString("catalog.product-list.empty-list.title",
                                                  comment: "The title to show when there are no results in a product list")
        static let emptySubtitle = MKLocalizedString("catalog.product-list.empty-list.subtitle",
                                                     comment: "The subtitle to show when there are no results in a product list")
    }

    @StateObject private var viewModel: ProductListViewModel

    public init(viewModel: ProductListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    private var emptyView: some View {
        AuxiliaryView(viewModel: AuxiliaryViewModel.emptyDataModel(title: Labels.emptyTitle,
                                                                   subtitle: Labels.emptySubtitle))
    }

    public var body: some View {
        GeometryReader { proxy in
            Group {
                if self.viewModel.shouldPresentRecentSearches {
                    RecentlySearchedView(viewModel: self.viewModel)
                } else {
                    ProductsView(datasource: self.viewModel.dataSource,
                                 onRetryTapped: self.viewModel.didCommitSearch,
                                 onFilterTapped: self.viewModel.didTapFilter,
                                 filterBadge: self.viewModel.selectedFilters.filterButtonBadge,
                                 onSortTapped: self.viewModel.didTapSort,
                                 onProductSelected: self.viewModel.didTapProduct,
                                 emptyView: { self.emptyView },
                                 waitingView: { LoadingView() },
                                 onBottomReached: self.viewModel.hasMoreResults ? {
                        self.viewModel.didReachEndOfProductList()
                    } : nil)
                }
            }.animation(.easeOut, value: proxy.safeAreaInsets.top)
        }
        .alert(alertContext: self.$viewModel.alertContext)
    }
}
