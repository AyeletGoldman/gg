// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

public struct SearchClientsSceneView: View {

    private enum Labels {
        static let createClientButtonTitle = MKLocalizedString("clients.search.create-client-button.title",
                                                               comment: "The create client button title for in client search")
    }

    @ObservedObject private var viewModel: SearchClientsViewModel
    @Environment(\.isModalPresentationStyle) private var isPresentedModally

    public init(viewModel: SearchClientsViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        SearchClientsView(viewModel: self.viewModel)
            .alert(alertContext: self.$viewModel.alertContext)
            .withFloatingActionView {
                if self.viewModel.showCreateClientButton {
                    PrimaryButton(buttonData: ButtonData(label: Labels.createClientButtonTitle,
                                                         action: self.viewModel.didTapCreateClient))
                    .padding()
                }
            }
            .resignKeyboardOnDragGesture()
            .style("background")
            // WARNING! WHY WOULD YOU PUT THIS PADDING HERE?
            // When updating the minimum deployment version for iOS from 14 to 15, the transparent navigation
            // bar was obscured by the background of the `SearchClientsView`. Something inside iOS changed
            // (there were wide changes to navigation bars in iOS 15) that meant that when
            // the search view was displayed the background would cover the navigation bar background image.
            // Adding a small padding fixes it, but the underlying cause is undiscovered.
            .padding(.top, 0.5)
    }
}

extension SearchClientsView {
    init(viewModel: SearchClientsViewModel,
         onDismissTapped: (() -> Void)? = nil) {
        let editMode = Binding<EditMode> { () -> EditMode in
            return viewModel.isEditing ? .active : .inactive
        } set: { (newValue: EditMode) in
            viewModel.isEditing = newValue == .active
        }
        let selectedClients = Binding<Set<String>> { () -> Set<String> in
            return viewModel.selectedClients
        } set: { (newValue: Set<String>) in
            viewModel.selectedClients = newValue
        }
        let searchText = Binding<String> { () -> String in
            return viewModel.searchText
        } set: { (newValue: String) in
            viewModel.searchText = newValue
        }
        self.init(dataSource: viewModel.dataSource,
                  editMode: editMode,
                  selectedClients: selectedClients,
                  searchText: searchText,
                  noticeMessage: viewModel.noticeMessage,
                  onSearchCommit: viewModel.didCommitSearch,
                  emptyDataModel: viewModel.getEmptyDataViewModel(),
                  recentlySearchedData: viewModel.recentSearchesData,
                  didSelectRow: viewModel.didSelectClientRow(_:),
                  rowContent: { row in
            row.cellProvider.cellCreation().eraseToAnyView()
                .contextMenu(actions: row.cellProvider.quickActions, performActionType: viewModel.handleActionType)
                .environment(\.editMode, editMode)
        })
    }
}
