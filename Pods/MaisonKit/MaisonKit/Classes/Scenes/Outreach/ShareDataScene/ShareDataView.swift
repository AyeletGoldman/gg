// Copyright © 2022 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

public struct ShareDataView: View {

    @ObservedObject private var viewModel: ShareDataViewModel

    public init(viewModel: ShareDataViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        SearchClientsView(shareDataViewModel: self.viewModel)
            .alert(alertContext: self.$viewModel.alertContext)
            .style("background")
    }
}

private enum ShareDataViewLabels {
    static let recordingInteractionLabel = MKLocalizedString("share-data.interaction.notice-message.title",
                                                             comment: "A string to show while the SDK records the interaction")
}

extension SearchClientsView {
    init(shareDataViewModel: ShareDataViewModel) {
        let searchText = Binding<String> { () -> String in
            return shareDataViewModel.searchText
        } set: { (newValue: String) in
            shareDataViewModel.searchText = newValue
        }
        self.init(dataSource: shareDataViewModel.dataSource,
                  editMode: .constant(.inactive),
                  selectedClients: .constant([]),
                  searchText: searchText,
                  noticeMessage: shareDataViewModel.isLoading ? ShareDataViewLabels.recordingInteractionLabel : nil,
                  emptyDataModel: shareDataViewModel.getEmptyDataViewModel(),
                  recentlySearchedData: shareDataViewModel.recentSearchesData,
                  didSelectRow: { row in
            shareDataViewModel.didSelectClient(row.cellProvider.clientID)
        },
                  rowContent: { row in
            row.cellProvider.cellCreation().eraseToAnyView()
        })
    }
}
