// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

public struct SelectionListSceneView: View {

    @ObservedObject private var viewModel: SelectionListViewModel

    public init(viewModel: SelectionListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Group {
            if self.viewModel.selectionMode == .multiple {
                SelectionListView(items: self.viewModel.items,
                                  selection: self.$viewModel.selectedItems,
                                  rowStylistIdentifier: self.viewModel.rowStylistIdentifier,
                                  shouldShowToolbar: self.viewModel.shouldShowToolbar,
                                  isRequired: self.viewModel.isRequired,
                                  totalItems: self.viewModel.totalItems,
                                  isRowEnabled: { item in
                    return item.isEnabled
                }, rowContent: { item in
                    SelectionListItemView(item: item)
                })
            } else {
                SelectionListView(items: self.viewModel.items,
                                  selection: self.$viewModel.selectedItem,
                                  rowStylistIdentifier: self.viewModel.rowStylistIdentifier,
                                  shouldShowToolbar: self.viewModel.shouldShowToolbar,
                                  isRequired: self.viewModel.isRequired,
                                  totalItems: self.viewModel.totalItems,
                                  isRowEnabled: { item in
                    return item.isEnabled
                }, rowContent: { item in
                    SelectionListItemView(item: item)
                })
            }
        }
        .style("background")
        .environment(\.editMode, .constant(.active))
    }
}
