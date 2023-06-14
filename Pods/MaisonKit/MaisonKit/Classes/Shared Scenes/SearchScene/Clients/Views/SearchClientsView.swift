// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

private enum SearchClientsViewLabels {
    static let searchBarPlaceholder = MKLocalizedString("clients.search.searchBar.placeholder",
                                                        comment: "The placeholder for the searchbar in client search")
}

struct SearchClientsView: View {

    @Binding private var editMode: EditMode
    @Binding private var searchText: String
    @Binding private var selectedClients: Set<String> // for multi selection
    @Binding private var selectedClient: String? // for single selection

    private let noticeMessage: String?
    private let dataSource: ResultState<[ClientSearchRowDisplayable], ErrorDisplayable>
    private let onSearchCommit: (() -> Void)?
    private let rowContent: (ClientSearchRowDisplayable) -> AnyView
    private let didSelectClientRow: (ClientSearchRowDisplayable) -> Void
    private let emptyDataModel: AuxiliaryViewModel
    private let recentlySearchedData: RecentlySearchedData
    private let selectionMode: SelectionMode

    init<Content: View>(dataSource: ResultState<[ClientSearchRowDisplayable], ErrorDisplayable>,
                        editMode: Binding<EditMode>,
                        selectedClients: Binding<Set<String>>,
                        searchText: Binding<String>,
                        noticeMessage: String? = nil,
                        onSearchCommit: (() -> Void)? = nil,
                        emptyDataModel: AuxiliaryViewModel,
                        recentlySearchedData: RecentlySearchedData,
                        didSelectRow: @escaping (ClientSearchRowDisplayable) -> Void,
                        @ViewBuilder rowContent: @escaping (ClientSearchRowDisplayable) -> Content) {
        self._editMode = editMode
        self.didSelectClientRow = didSelectRow
        self._searchText = searchText
        self._selectedClients = selectedClients
        self._selectedClient = .constant(nil)
        self.selectionMode = .multiple
        self.dataSource = dataSource
        self.onSearchCommit = onSearchCommit
        self.emptyDataModel = emptyDataModel
        self.recentlySearchedData = recentlySearchedData
        self.rowContent = { return rowContent($0).eraseToAnyView() }
        self.noticeMessage = noticeMessage
    }

    // Single selection constructor
    init<Content: View>(dataSource: ResultState<[ClientSearchRowDisplayable], ErrorDisplayable>,
                        selectedClient: Binding<String?>,
                        searchText: Binding<String>,
                        noticeMessage: String? = nil,
                        onSearchCommit: (() -> Void)? = nil,
                        emptyDataModel: AuxiliaryViewModel,
                        recentlySearchedData: RecentlySearchedData,
                        @ViewBuilder rowContent: @escaping (ClientSearchRowDisplayable) -> Content) {
        self._editMode = .constant(.active)
        self.didSelectClientRow = { _ in }
        self._searchText = searchText
        self._selectedClient = selectedClient
        self._selectedClients = .constant([])
        self.selectionMode = .single
        self.dataSource = dataSource
        self.onSearchCommit = onSearchCommit
        self.emptyDataModel = emptyDataModel
        self.recentlySearchedData = recentlySearchedData
        self.rowContent = { return rowContent($0).eraseToAnyView() }
        self.noticeMessage = noticeMessage
    }

    var body: some View {
        ResultStateViewBuilder(result: self.dataSource)
            .setWaitingView {
                RecentlySearchedView(data: self.recentlySearchedData)
            }.setEmptyView {
                AuxiliaryView(viewModel: self.emptyDataModel, automaticallyCenterInView: false)
                    .padding(.horizontal)
                    .padding(.top, 70)
            }.setLoadingView {
                self.buildResultsList(clientSearchRows: .loadingData)
            }.buildContent { clientSearchRows in
                self.buildResultsList(clientSearchRows: clientSearchRows)
            }.withNoticeText(text: self.noticeMessage)
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .environment(\.editMode, self.$editMode)
    }

    @ViewBuilder
    private func buildResultsList(clientSearchRows: [ClientSearchRowDisplayable]) -> some View {
        Group {
            if self.selectionMode == .multiple {
                SelectionListView(items: clientSearchRows,
                                  selection: self.$selectedClients,
                                  rowStylistIdentifier: "client-row",
                                  rowContent: self.buildClientRow)
            } else {
                SelectionListView(items: clientSearchRows,
                                  selection: self.$selectedClient,
                                  rowStylistIdentifier: "client-row",
                                  rowContent: self.buildClientRow)
            }
        }.resignKeyboardOnDragGesture()
    }

    @ViewBuilder
    func buildClientRow(row: ClientSearchRowDisplayable) -> some View {
        Button(action: {
            self.didSelectClientRow(row)
        }, label: {
            self.rowContent(row).contentShape(Rectangle())
        })
        .buttonStyle(PlainButtonStyle())
    }
}

extension Array where Element == ClientSearchRowDisplayable {
    static var loadingData: [ClientSearchRowDisplayable] {
        return (0...10).map {
            ClientSearchRowDisplayable(id: "\($0)",
                                       clientName: "Jessy Person",
                                       client: MemberRowDisplayable(id: "\($0)",
                                                                    title: "Example Person",
                                                                    subtitle: LabeledValue(label: "Date", value: Date().toString()),
                                                                    segments: ["Test"],
                                                                    isMyCustomer: true))
        }
    }
}
