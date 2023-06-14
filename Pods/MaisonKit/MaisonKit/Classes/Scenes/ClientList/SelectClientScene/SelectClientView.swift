//  Copyright © 2022 LVMH. All rights reserved.

import SwiftUI

struct SelectClientView: View {

    @ObservedObject private var viewModel: SelectClientViewModel

    init(viewModel: SelectClientViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        SearchClientsView(viewModel: self.viewModel)
            .alert(alertContext: self.$viewModel.alertContext)
            .style("background")
    }
}

extension SearchClientsView {
    init(viewModel: SelectClientViewModel) {
        let selectedClientId = Binding<String?> { () -> String? in
            return viewModel.selectedClientId
        } set: { (newValue: String?) in
            viewModel.selectedClientId = newValue
        }
        let searchText = Binding<String> { () -> String in
            return viewModel.searchText
        } set: { (newValue: String) in
            viewModel.searchText = newValue
        }
        self.init(dataSource: viewModel.dataSource,
                  selectedClient: selectedClientId,
                  searchText: searchText,
                  emptyDataModel: viewModel.getEmptyDataViewModel(),
                  recentlySearchedData: viewModel.recentSearchesData,
                  rowContent: { row in
            row.cellProvider.cellCreation().eraseToAnyView()
        })
    }
}
