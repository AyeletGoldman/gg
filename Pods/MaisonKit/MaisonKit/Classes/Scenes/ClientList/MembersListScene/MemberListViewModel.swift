// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine
import StylableSwiftUI
import Biodag

public final class MemberListViewModel: ObservableObject {

    private enum Labels {
        static let clientListDeleteConfirmationMessage = MKLocalizedString("client-list.delete-confirmation.message",
                                                                           comment: """
            Message for alert to show confirmation of removing a client from a client list without the client name
            """)
        static let clientListDeleteConfirmationBodyFormat = MKLocalizedString("client-list.delete-confirmation.client-name.message",
                                                                                 comment: """
            Message for alert to show confirmation of removing a client from a list including the client name
            """)

        static let clientListDeleteConfirmationButtonTitle = MKLocalizedString("client-list.delete-confirmation.button.title",
                                                                               comment: "Title for alert button to show confirmation of removing a client from a list")
        static let clientListDeleteConfirmationTitle = MKLocalizedString("client-list.delete-confirmation.title",
                                                                         comment: "Title for alert to show delete confirmation")
        static let clientListDeletionToastErrorTitle = MKLocalizedString("client-list.deletion.toast.error.title",
                                                                         comment: "Message to show on the toast view when deleting a client from a list fails")

        static let clientListEditableEmptyTitle = MKLocalizedString("client-list.empty.editable.title",
                                                                    comment: "The title of the empty view when the member's list is editable")
        static let clientListEditableEmptySubtitle = MKLocalizedString("client-list.empty.editable.subtitle",
                                                                      comment: "The subtitle of the empty view when the member's list is editable")
        static let clientListEditableEmptyButtonTitle = MKLocalizedString("client-list.empty.editable.button.title",
                                                                          comment: "The title of the button when the empty view is shown in a list that is editable")

        static let clientListNotEditableEmptyTitle = MKLocalizedString("client-list.empty.non-editable.title",
                                                                       comment: "The title of the empty view when the member's list is not editable")
        static let clientListNotEditableEmptySubtitle = MKLocalizedString("client-list.empty.non-editable.subtitle",
                                                                          comment: "The subtitle of the empty view when the member's list is not editable")
        static let clientListNotEditableEmptyButtonTitle = MKLocalizedString("client-list.empty.non-editable.button.title",
                                                                             comment: "The title of the button when the empty view is shown in a list that is not editable")
    }

    @Published private(set) var dataSource: ResultState<ClientListMemberState, ErrorDisplayable> = .waiting
    @Published private(set) var isEditable = false
    @Published private(set) var listName = ""
    @Published var alertContext: AlertContext?
    @Published var selectedTabID = ""
    private var lastLoadedPageCursors: [String: String] = [:]

    private var cancellables = Set<AnyCancellable>()
    var shouldShowSortButton: Bool {
        return !self.sortItems.isEmpty && self.dataSource.value?.hasMembers == true
    }

    private var sortItems: [SortItem] {
        return self.dataSource.value?.sortItems ?? []
    }

    private let listId: String
    @Inject private var store: LoadableClientListStoring
    private let listType: String
    private let router: MemberListRouter
    private let onDeleted: (() -> Void)?

    public init(listId: String,
                listType: String,
                router: MemberListRouter,
                onDeleted: (() -> Void)?) {
        self.listId = listId
        self.listType = listType
        self.router = router
        self.onDeleted = onDeleted

        self.setupIsEditableListener()
        self.setupListNameListener()
    }

    private func setupIsEditableListener() {
        self.$dataSource.map {
            return $0.value?.isEditable ?? false
        }.assign(to: &self.$isEditable)
    }

    private func setupListNameListener() {
        self.$dataSource
            .compactMap { $0.value?.listName }
            .assign(to: &self.$listName)
    }

    // This sets up the initial subscription between the store and the data source.
    // It is therefore only called when you either fetch the initial data, or you are reloading the whole list.
    func fetchClientListMembers(reload: Bool = false, sortCriteria: String? = nil) {
        if !(reload || self.dataSource.isWaiting) {
            return
        }
        // First load or reload, so there is no cursor to pass in.
        self.store.fetchClientListMembers(clientListId: self.listId, tabID: nil, sortBy: sortCriteria, cursor: nil)
            .handleEvents(receiveSubscription: { [weak self] _ in
                guard let self = self else { return }
                self.dataSource = .loading(self.dataSource.value)
            }, receiveOutput: { [weak self] resultState in
                guard let self = self else { return }
                guard let value = resultState.value else { return }
                switch value.mode {
                case .classic: break
                case .tabbed(let tabs):
                    guard let firstTab = tabs?.first, self.selectedTabID.isEmpty else { return }
                    self.selectedTabID = firstTab.id
                }
            })
            .assign(to: &self.$dataSource)
    }

    func logViewAnalytics() {
        Analytics.log(ViewedClientListEvent(listType: self.listType))
    }

    func presentDeleteMemberConfirmation(at indexSet: IndexSet) {
        guard let list = self.dataSource.value, let index = indexSet.first else {
            return
        }

        // only support deleting one member at a time
        let message = self.buildAlertConfirmationMessage(list: list, index: index)

        let confirmButton = AlertContext.Button(title: Labels.clientListDeleteConfirmationButtonTitle,
                                                style: .destructive(action: { [weak self] in
                                                    self?.deleteListMember(at: indexSet)
                                                }))
        self.alertContext = AlertContext(title: Labels.clientListDeleteConfirmationTitle,
                                         message: message,
                                         primaryButton: .cancel(),
                                         secondaryButton: confirmButton)
    }

    private func buildAlertConfirmationMessage(list: ClientListMemberState, index: Int) -> String {
        let memberName: String? = {
            switch list.mode {
            case .classic(let members, _, _):
                return members?[safe: index]?.cellProvider.clientName
            case .tabbed(let tabs):
                return tabs?.first(where: { $0.id == self.selectedTabID })?.members[safe: index]?.cellProvider.clientName
            }
        }()
        guard let memberName else {
            return Labels.clientListDeleteConfirmationMessage
        }

        let format = Labels.clientListDeleteConfirmationBodyFormat
        return String(format: format, memberName)
    }

    private func deleteListMember(at indexes: IndexSet) {
        guard let list = self.dataSource.value else {
            return
        }

        for index in indexes {
            guard let member = list.mode.memberAtIndex(index, tabID: self.selectedTabID) else { continue }

            self.store.deleteClientListMember(listId: self.listId,
                                              memberId: member.listMemberId)
                .sink { result in
                    switch result {
                    case .failure:
                        ToastView.show(text: Labels.clientListDeletionToastErrorTitle,
                                       style: .error)
                    case .success:
                        break
                    }
            }.store(in: &self.cancellables)
        }
    }

    func getEmptyMembersViewModel() -> AuxiliaryViewModel {
        if self.isEditable {
            return AuxiliaryViewModel.emptyDataModel(
                title: Labels.clientListEditableEmptyTitle,
                subtitle: Labels.clientListEditableEmptySubtitle,
                buttonData: ButtonData(
                    label: Labels.clientListEditableEmptyButtonTitle,
                    icon: StylistIdentifier("icon-add"),
                    action: {
                        self.presentEditScreen()
                })
            )
        } else {
            return AuxiliaryViewModel.emptyDataModel(
                title: Labels.clientListNotEditableEmptyTitle,
                subtitle: Labels.clientListNotEditableEmptySubtitle,
                buttonData: ButtonData(
                    label: Labels.clientListNotEditableEmptyButtonTitle,
                    icon: StylistIdentifier("icon-retry"),
                    action: {
                        if self.selectedTabID.isEmpty {
                            self.fetchClientListMembers(reload: true)
                        } else {
                            _ = self.store.fetchClientListMembers(clientListId: self.listId,
                                                                  tabID: self.selectedTabID,
                                                                  sortBy: self.dataSource.value?.selectedSortValue,
                                                                  cursor: nil)
                        }
                    })
            )
        }
    }

    func didSelectListMember(_ member: ClientMemberDisplayable) {
        self.router.presentClient360(clientId: member.cellProvider.clientID, clientName: member.cellProvider.clientName)
    }

    func loadNextPage(for tabID: String? = nil) {
        let cursor: String? = self.getCurrentListCursor(for: tabID)
        guard let cursor else { return }
        let lastLoadedPageCursor = self.lastLoadedPageCursors[tabID ?? self.listId]
        if lastLoadedPageCursor == cursor { return }
        self.lastLoadedPageCursors[tabID ?? self.listId] = cursor
        _ = self.store.fetchClientListMembers(clientListId: self.listId,
                                              tabID: tabID,
                                              sortBy: self.dataSource.value?.selectedSortValue,
                                              cursor: cursor)
    }

    private func getCurrentListCursor(for tabID: String? = nil) -> String? {
        guard let state = self.dataSource.value else { return nil }
        switch state.mode {
        case .tabbed(let tabs):
            return tabs?.first(where: { $0.id == tabID })?.currentTabCursor
        case .classic(_, let currentListCursor, _):
            return currentListCursor
        }
    }
}

// MARK: - Routing

extension MemberListViewModel {
    func presentEditScreen() {
        self.router.presentEditList(listId: self.listId,
                                    listName: self.listName,
                                    onDone: { [weak self] isBeingDeleted in
                                        if isBeingDeleted {
                                            self?.onDeleted?()
                                        }
                                    })
    }

    func presentSortScreen() {
        let initialSortValue = self.dataSource.value?.selectedSortValue
        self.router.presentMemberListSort(sortItems: self.sortItems, initialSortValue: initialSortValue) { [weak self] newSortCriteria in
            self?.fetchClientListMembers(reload: true, sortCriteria: newSortCriteria)
        }
    }
}

extension MemberListViewModel: ActionHandlerViewModel {
    var actionHandlingRouter: ActionScenePresenterRouter { return self.router }
}

private extension ClientListMode {
    func memberAtIndex(_ index: Int, tabID: String?) -> ClientMemberDisplayable? {
        switch self {
        case .tabbed(let tabs):
            guard let tabID else { return nil }
            guard let tab = tabs?.first(where: { $0.id == tabID }) else { return nil }
            return tab.members[safe: index]
        case .classic(let members, _, _):
            return members?[safe: index]
        }
    }
}
