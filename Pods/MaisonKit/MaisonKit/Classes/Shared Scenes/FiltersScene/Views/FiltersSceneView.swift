// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct FiltersSceneView: View {

    @ObservedObject private var viewModel: FiltersViewModel

    public init(viewModel: FiltersViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        FiltersView(selectedFilters: self.$viewModel.selectedFilters,
                    filters: self.viewModel.filters,
                    errorFilterIds: self.$viewModel.errorFilterIds,
                    shouldShowToolbar: self.viewModel.shouldShowToolbar,
                    presentFilterDetails: self.viewModel.presentFilterDetails,
                    totalItems: self.viewModel.$totalItems.eraseToAnyPublisher())
    }
}
