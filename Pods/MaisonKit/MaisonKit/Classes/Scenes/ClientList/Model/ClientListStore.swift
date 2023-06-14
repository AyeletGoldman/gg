// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI
import Combine
import Biodag

/// A convenience for a publisher that can finish with either a `Result<ClientListDisplayable, ErrorDisplayable>` or an `Error`
public typealias ClientListDisplayableResultPublisher = AnyPublisher<Result<ClientListDisplayable, ErrorDisplayable>, Error>

/// A protocol to implement as a facade for storing client lists. Enables MaisonKit to produce client lists that use
/// optimistic updates for the operations they support.
public protocol ClientListStoring {

    /// A publisher that holds the current client lists.
    var clientListsPublisher: AnyPublisher<ClientListSection?, Never> { get }

    /// Fetches the client lists available
    /// Implement this function to return the available sections in a client list-of-lists scene.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ClientListSection` or an `ErrorDisplayable`.
    func fetchClientLists() -> AnyPublisher<Result<ClientListSection, ErrorDisplayable>, Error>

    /// Delete the client list with the given list ID.
    /// - Parameter listId: the ID of the list we want to delete.
    /// - Returns: A publisher that, when resolved, will return a `Result` with either `Void` return or an `ErrorDisplayable`
    func deleteClientList(listId: ListID) -> VoidResultPublisher

    /// Fetch a list of members from the client list with the given ID, optionally sorted by a given value.
    /// - Parameters:
    ///   - clientListId: the list ID to fetch clients from.
    ///   - tabID: the ID of the tab for which we want to load new members. Initially, this may be `nil` as we don't know if there
    ///   will be tabs or not when we request the data. However, after the first load, the tab ID may exist if we are loading the next page in a tab.
    ///   - sortBy: an optional sort order.
    ///   - cursor: the cursor to use to aid in pagination. When a cursor is passed to the receiver, it should be used to fetch the page starting at that cursor.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ClientListDisplayable` or `ErrorDisplayable` in case of an error
    func fetchClientListMembers(clientListId: ListID, tabID: String?, sortBy: SelectedSortValue?, cursor: String?) -> ClientListDisplayableResultPublisher

    /// Fetches all clients in a list. Use this method to bypass implementing pagination yourself.
    /// - Parameters:
    ///   - clientListId: the list ID to fetch clients from.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ClientListDisplayable` or `ErrorDisplayable` in case of an error
    func fetchAllClientListMembers(clientListId: ListID) -> AnyPublisher<Result<[ClientMemberDisplayable], ErrorDisplayable>, Error>

    /// Delete a member from a client list.
    /// Note: This operation should only remove the client from the list and not delete the client itself.
    /// - Parameters:
    ///   - listId: The ID of the list we want to delete the member from
    ///   - memberId: the ID of the client. This is not necessarily the "user ID" but most likely a unique identifier for the client in the given list.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `Void` or `ErrorDisplayable` in case of an error
    func deleteClientListMember(listId: ListID, memberId: String) -> VoidResultPublisher

    /// Update or create a client list with the given name and client IDs. If the listId is also given, the list should be updated.
    /// - Parameters:
    ///   - listId: optional. the list ID to update.
    ///   - listName: the name to set the list to
    ///   - clientIds: an array of client IDs. These IDs should replace whatever is in the current list, they should not be appended to the list.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `ClientListDisplayable` or `ErrorDisplayable` in case of an error
    func upsertClientList(listId: ListID?, listName: String, clientIds: [String]) -> ClientListDisplayableResultPublisher

    /// Requests the actions to be displayed in the top-right corner of the main client lists view
    /// - Returns: A publisher that, when resolved, will return an array of `MenuAction` objects.
    /// This publisher cannot fail, and error states should be mapped to an empty array.
    func getMainClientListsNavigationActions() -> AnyPublisher<[MenuAction], Never>
}

public final class ClientListStore: ObservableObject {

    public static let shared = ClientListStore()

    @Published private var clientLists: ClientListSection?

    @Inject private var clientListAdapter: ClientListAdapter
    private var cancellables = Set<AnyCancellable>()

    public init() { }
}

extension ClientListStore: ClientListStoring {

    public var clientListsPublisher: AnyPublisher<ClientListSection?, Never> {
        return self.$clientLists.eraseToAnyPublisher()
    }

    // Fetches  the latest client lists and, on success, updates the client lists in this store
    public func fetchClientLists() -> AnyPublisher<Result<ClientListSection, ErrorDisplayable>, Error> {
        let publisher = self.clientListAdapter.getClientLists()
            .share().eraseToAnyPublisher()
        publisher
            .catch { return Just(.failure(ErrorDisplayable($0))) }
            .map { $0.value }
            .assign(to: \.clientLists, on: self)
            .store(in: &self.cancellables)
        return publisher
    }

    /// Optimistically deletes a client from a list.
    /// If the upstream deletion fails, the deletion is reverted.
    /// - Parameter listId: the ID of the client list to delete
    /// - Returns: a publisher whose output is a result type which on success will return nothing and errors with an `ErrorDisplayable`
    public func deleteClientList(listId: ListID) -> VoidResultPublisher {
        let operation = self.clientLists?.deletePersonalList(id: listId)
        let publisher = self.clientListAdapter.deleteClientList(listId: listId)
            .share().eraseToAnyPublisher()
        publisher
            .catch { return Just(.failure(ErrorDisplayable($0))) }
            .sink { [weak self] result in
                if !result.isSuccess, let operation = operation {
                    self?.clientLists?.revert(operation: operation)
                }
            }.store(in: &self.cancellables)
         return publisher
    }

    public func fetchClientListMembers(clientListId: ListID, tabID: String?, sortBy: SelectedSortValue?, cursor: String?) -> ClientListDisplayableResultPublisher {
        let publisher = self.clientListAdapter.getClientListMembers(listID: clientListId, tabID: tabID, sortBy: sortBy, cursor: cursor)
            .patchUnimplemented(to: self.clientListAdapter.getClientListMembers(listId: clientListId,
                                                                                sortBy: sortBy))
            .share().eraseToAnyPublisher()
        publisher
            .catch { return Just(.failure(ErrorDisplayable($0))) }
            .sink { [weak self] result in
                guard let members = result.value else { return }
                // If we have a tab ID and not cursor we still want to merge, because we're reloading a list
                // So the logic is:
                // if there is a tab ID always merge
                // if there is no tab ID only merge if there is a cursor
                self?.clientLists?.updateList(clientList: members, tabID: tabID, merge: (tabID != nil || cursor != nil))
        }.store(in: &self.cancellables)
        return publisher
    }

    public func fetchAllClientListMembers(clientListId: ListID) -> AnyPublisher<Result<[ClientMemberDisplayable], ErrorDisplayable>, Error> {
        return self.clientListAdapter.getAllClientListMembers(listID: clientListId)
    }

    public func deleteClientListMember(listId: ListID, memberId: String) -> VoidResultPublisher {
        let operation = self.clientLists?.deleteMember(listId: listId, memberId: memberId)
        let publisher = self.clientListAdapter.deleteClientListMember(memberId: memberId)
            .share().eraseToAnyPublisher()
        publisher
            .catch { return Just(.failure(ErrorDisplayable($0))) }
            .sink { [weak self] result in
                if !result.isSuccess, let operation = operation {
                    self?.clientLists?.revert(operation: operation)
                }
        }.store(in: &self.cancellables)
        return publisher
    }

    public func upsertClientList(listId: ListID?, listName: String, clientIds: [String]) -> ClientListDisplayableResultPublisher {
        return self.clientListAdapter.upsertClientList(listId: listId, listName: listName, listMemberIds: clientIds)
            .handleEvents(receiveOutput: { [weak self] in
                guard let self = self else { return }
                switch $0 {
                case .failure:
                    break
                case .success(let displayable):
                    self.clientLists?.updateList(clientList: displayable, tabID: nil, merge: false)
                }
            }).eraseToAnyPublisher()
    }

    public func getMainClientListsNavigationActions() -> AnyPublisher<[MenuAction], Never> {
        return self.clientListAdapter.getMainClientListsNavigationActions()
    }
}

private enum ReversibleOperation {
    case deleteTabMember(index: Int, listID: ListID, tabID: String, member: ClientMemberDisplayable)
    case deleteListMember(index: Int, listId: ListID, member: ClientMemberDisplayable)
    case deleteList(index: Int, list: ClientListDisplayable)
}

private extension ClientListSection {
    mutating func deleteMember(listId: ListID, memberId: String) -> ReversibleOperation? {
        let index = self.personal.clientLists.firstIndex { list in
            return list.id == listId
        }
        guard let actualIndex = index else { return nil }
        var list = self.personal.clientLists[actualIndex]
        let operation = list.removeClientFromList(memberID: memberId)
        self.personal.clientLists[actualIndex] = list
        return operation
    }

    mutating func deletePersonalList(id: ListID) -> ReversibleOperation? {
        guard let index = self.personal.clientLists.firstIndex(where: { $0.id == id }) else {
            return nil
        }
        let list = self.personal.clientLists.remove(at: index)
        return .deleteList(index: Int(index), list: list)
    }

    mutating func updateList(clientList: ClientListDisplayable, tabID: String?, merge: Bool) {
        // Updating the lists can mean one of two things:
        // 1. Update a featured list
        // 2. Update a personal client list
        // In both cases, we can either merge the clients to the current list or replace all clients in the list with the new clients.
        // Usually, if you are refreshing a page or loading for the first time you will replace the list completely.

        // If we find the client list in the featured lists
        if let row = self.featured.clientLists.firstIndex(where: { $0.id == clientList.id}) {
            // If we are being asked to merge the current list with the given list
            if merge {
                // We just merge the members, so get the members from the list & possibly tab too
                let members = clientList.mode.getAllMembers(tabID: tabID)
                // Add the members to the list we found
                self.featured.clientLists[row].addMembersToList(members, tabID: tabID)
            } else {
                // We are not merging so just replace the whole list
                self.featured.clientLists[row] = clientList
            }
            // Update the cursor for whatever mode we are in
            self.featured.clientLists[row].updateCursorIfNecessary(clientList: clientList, tabID: tabID)
        } else {
            // If the list wasn't found in the featured lists, it must be in the personal lists
            if let row = self.personal.clientLists.firstIndex(where: {$0.id == clientList.id}) {
                // If we are being asked to merge the current list with the given list (this is usually during pagination events)
                if merge {
                    // We want to merge only the members, the rest of the list remains as-is.
                    let members = clientList.mode.getAllMembers(tabID: tabID)
                    // Add the members to the list we found
                    self.personal.clientLists[row].addMembersToList(members, tabID: tabID)
                } else {
                    // If we are not merging, replace the whole list
                    self.personal.clientLists[row] = clientList
                }
                // Update the cursor for whatever mode we are in
                self.personal.clientLists[row].updateCursorIfNecessary(clientList: clientList, tabID: tabID)
            } else {
                // If we couldn't find the list in the personal lists we are creating a new list, so add it to the end of the personal lists
                self.personal.clientLists.append(clientList)
            }
        }
    }

    mutating func revert(operation: ReversibleOperation) {
        switch operation {
        case .deleteList(let index, let list):
            self.personal.clientLists.insert(list, at: index)
        case .deleteListMember(let index, let listId, let member):
            guard let listIndex = self.personal.clientLists.firstIndex(where: { $0.id == listId }) else {
                return
            }
            var list = self.personal.clientLists[listIndex]
            switch list.mode {
            case .classic(let members, let cursor, let numberOfClients):
                var members = members
                members?.insert(member, at: index)
                list.mode = .classic(members: members, currentListCursor: cursor, totalNumberOfClients: numberOfClients)
                self.personal.clientLists[listIndex] = list
            case .tabbed: break
            }
        case .deleteTabMember(let index, let listID, let tabID, let member):
            guard let listIndex = self.personal.clientLists.firstIndex(where: { $0.id == listID }) else { return }
            var list = self.personal.clientLists[listIndex]
            switch list.mode {
            case .classic: break
            case .tabbed(let tabs):
                guard let tabIndex = tabs?.firstIndex(where: { $0.id == tabID }) else { return }
                guard var tab = tabs?[tabIndex] else { return }
                tab.members.insert(member, at: index)
                var tabs = tabs
                tabs?[tabIndex] = tab
                list.mode = .tabbed(tabs: tabs)
                self.personal.clientLists[listIndex] = list
            }
        }
    }
}

private extension ClientListDisplayable {
    mutating func removeClientFromList(memberID: String) -> ReversibleOperation? {
        switch self.mode {
        case .tabbed(var tabs):
            // Get the tab that contains the member we want to remove
            guard var tab = tabs?.first(where: { $0.members.contains(where: { $0.listMemberId == memberID }) }) else {
                return nil
            }
            // Get the index of the member we want to remove
            guard let index = tab.members.firstIndex(where: { $0.listMemberId == memberID }) else {
                return nil
            }
            // Get the index of the tab
            guard let tabIndex = tabs?.firstIndex(where: { $0.id == tab.id }) else {
                return nil
            }
            // Remove the member and update the tabs
            let member = tab.members.remove(at: index)
            tabs?[tabIndex] = tab
            self.mode = .tabbed(tabs: tabs)
            return .deleteTabMember(index: index, listID: self.id, tabID: tab.id, member: member)
        case .classic(let members, let cursor, let numberOfClients):
            var members = members
            guard let index = members?.firstIndex(where: { $0.listMemberId == memberID }) else {
                return nil
            }
            guard let member = members?.remove(at: index) else {
                return nil
            }
            self.mode = .classic(members: members, currentListCursor: cursor, totalNumberOfClients: numberOfClients)
            return .deleteListMember(index: Int(index), listId: self.id, member: member)
        }
    }

    mutating func addMembersToList(_ members: [ClientMemberDisplayable], tabID: String?) {
        self.mode = self.mode.appending(members: members, tabID: tabID)
    }

    mutating func updateCursorIfNecessary(clientList: ClientListDisplayable, tabID: String?) {
        switch clientList.mode {
        case .classic(_, let cursor, _):
            switch self.mode {
            case .classic(let members, _, let numberOfClients):
                self.mode = .classic(members: members, currentListCursor: cursor, totalNumberOfClients: numberOfClients)
            case .tabbed:
                return
            }
        case .tabbed(let newClientListTabs):
            guard let tabID else { return }
            switch self.mode {
            case .classic: return
            case .tabbed(var tabs):
                guard var tabs else { return }
                guard let index = tabs.firstIndex(where: { $0.id == tabID }) else { return }
                guard var tab = tabs[safe: index] else { return }
                tab.currentTabCursor = newClientListTabs?.first(where: { $0.id == tabID })?.currentTabCursor
                tabs[index] = tab
                self.mode = .tabbed(tabs: tabs)
            }
        }
    }
}

private extension ClientListMode {
    func getAllMembers(tabID: String?) -> [ClientMemberDisplayable] {
        switch self {
        case .tabbed(let tabs):
            guard let tabID, let tabs else { return [] }
            return tabs.first(where: { $0.id == tabID })?.members ?? []
        case .classic(let members, _, _):
            return members ?? []
        }
    }

    func appending(members: [ClientMemberDisplayable], tabID: String?) -> ClientListMode {
        switch self {
        case .tabbed(var tabs):
            guard let tabID, var tabs else { return .tabbed(tabs: tabs) }
            guard let index = tabs.firstIndex(where: { $0.id == tabID }),
                  var tab = tabs[safe: index] else { return .tabbed(tabs: tabs) }
            tab.members.append(contentsOf: members)
            tabs[index] = tab
            return .tabbed(tabs: tabs)
        case .classic(var currentMembers, let currentListCursor, let numberOfClients):
            currentMembers?.append(contentsOf: members)
            return .classic(members: currentMembers, currentListCursor: currentListCursor, totalNumberOfClients: numberOfClients)
        }
    }
}
