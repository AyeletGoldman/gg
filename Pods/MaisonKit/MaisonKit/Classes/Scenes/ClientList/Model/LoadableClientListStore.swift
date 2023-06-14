// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine

/// A protocol to conform to that handles errors from upstream publishers
/// Allows the implementer to model the status of requests using `ResultState` instead of a basic `Result` type.
public protocol LoadableClientListStoring {

    /// Fetches the client lists, and masks any `Error` in the publisher into the `ResultState`'s `ErrorDisplayable`
    /// - Returns: A publisher that, when resolved, will return a `ResultState` of either `ClientListSection` or an `ErrorDisplayable`.
    /// This return value allows the implementer to control when a loading state is shown for the view
    /// This publisher cannot fail; failures should be mapped to the `ErrorDisplayable` state of the `Result`
    func fetchClientLists() -> AnyPublisher<ResultState<ClientListSection, ErrorDisplayable>, Never>

    /// Delete a client list with the given list ID
    /// - Parameter listId: the list ID to delete.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `Void` or an `ErrorDisplayable`.
    /// This publisher cannot fail; failures should be mapped to the `ErrorDisplayable` state of the `Result`
    func deleteClientList(listId: ListID) -> AnyPublisher<Result<Void, ErrorDisplayable>, Never>

    /// Fetches the members of a given client list ordered by a given sort order, if available.
    /// - Parameters:
    ///   - clientListId: the ID of the list to fetch members from
    ///   - tabID: the ID of the tab for which we want to load new members. Initially, this may be `nil` as we don't know if there
    ///   will be tabs or not when we request the data. However, after the first load, the tab ID may exist if we are loading the next page in a tab.
    ///   - sortBy: an optional order to order the members of the list by
    ///   - cursor: the cursor to use to aid in pagination. When a cursor is passed to the receiver, it should be used to fetch the page starting at that cursor.
    /// - Returns: A publisher that, when resolved, will return a `ResultState` of either `ClientListMemberState` or an `ErrorDisplayable`.
    /// This return value allows the implementer to control when a loading state is shown for the view
    /// This publisher cannot fail; failures should be mapped to the `ErrorDisplayable` state of the `Result`
    @discardableResult
    func fetchClientListMembers(clientListId: ListID,
                                tabID: String?,
                                sortBy: SelectedSortValue?,
                                cursor: String?) -> AnyPublisher<ResultState<ClientListMemberState, ErrorDisplayable>, Never>

    /// Fetches all the members of a given client list ordered by a given sort order, if available.
    /// - Parameters:
    ///   - clientListId: the ID of the list to fetch members from
    /// - Returns: A publisher that, when resolved, will return a `ResultState` of either `ClientListMemberState` or an `ErrorDisplayable`.
    func fetchAllClientListMembers(clientListId: ListID) -> AnyPublisher<ResultState<[ClientMemberDisplayable], ErrorDisplayable>, Never>

    /// Delete a member from a client list.
    /// Note: This operation should only remove the client from the list and not delete the client itself.
    /// - Parameters:
    ///   - listId: The ID of the list we want to delete the member from
    ///   - memberId: the ID of the client. This is not necessarily the "user ID" but most likely a unique identifier for the client in the given list.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `Void` or an `ErrorDisplayable`.
    /// This publisher cannot fail; failures should be mapped to the `ErrorDisplayable` state of the `Result`
    func deleteClientListMember(listId: ListID, memberId: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Never>

    /// Update or create a client list with the given name and client IDs. If the listId is also given, the list should be updated.
    /// - Parameters:
    ///   - listId: optional. the list ID to update.
    ///   - listName: the name to set the list to
    ///   - clientIds: an array of client IDs. These IDs should replace whatever is in the current list, they should not be appended to the list.
    /// - Returns: a publisher whose output is a `Result` which contains the state of the client list after the upsert, or an error.
    func upsertClientList(listId: ListID?, listName: String, clientIds: [String]) -> ClientListDisplayableResultPublisher

    /// Requests the actions to be displayed in the top-right corner of the main client lists view
    /// - Returns: a publisher that will, on success, contain the list of `MenuAction`s to be shown in the navigation bar
    // swiftlint:disable:next line_length
    @available(*, deprecated, message: "Deprecated on version 0.23.0. This function has been deprecated in favor of create client navigation button. This button is controlled by the feature flag `.createClient` and presents `CreateClientRouteDescriptor`.")
    func getMainClientListsNavigationActions() -> AnyPublisher<[MenuAction], Never>
}

public extension LoadableClientListStoring {
    /// Default implementation to `getMainClientListsNavigationActions` until this function will be deleted
    /// - Returns: A publisher whose output is an empty array of `MenuAction` objects to insert into the navigation view's trailing edge.
    // swiftlint:disable:next line_length
    @available(*, deprecated, message: "Deprecated on version 0.23.0. This function has been deprecated in favor of create client navigation button. This button is controlled by the feature flag `.createClient` and presents `CreateClientRouteDescriptor`.")
    func getMainClientListsNavigationActions() -> AnyPublisher<[MenuAction], Never> {
        return Just([]).eraseToAnyPublisher()
    }
}

public final class LoadableClientListStore: LoadableClientListStoring {

    private let store: ClientListStoring

    public init(store: ClientListStoring = ClientListStore.shared) {
        self.store = store
    }

    public func fetchClientLists() -> AnyPublisher<ResultState<ClientListSection, ErrorDisplayable>, Never> {
        // We don't need success, because we're going to
        // listen to the store's values.
        let request = self.store.fetchClientLists()
            .filter { !$0.isSuccess }
            .map { result -> ResultState<ClientListSection, ErrorDisplayable> in
                switch result {
                case .failure(let error):
                    return .failed(error)
                case .success(let section):
                    return .found(section)
                }
            }.catch { error in
                return Just(.failed(ErrorDisplayable(error)))
            }

        let storeValue = self.store.clientListsPublisher
            .compactMap { $0 }
            .map { items -> ResultState<ClientListSection, ErrorDisplayable> in
                return .found(items)
            }

        return Just(.loading(nil))
            .merge(with: request, storeValue)
            .eraseToAnyPublisher()
    }

    public func deleteClientList(listId: ListID) -> AnyPublisher<Result<Void, ErrorDisplayable>, Never> {
        return self.store.deleteClientList(listId: listId)
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
        }.eraseToAnyPublisher()
    }

    public func fetchClientListMembers(clientListId: ListID,
                                       tabID: String?,
                                       sortBy: SelectedSortValue?,
                                       cursor: String?) -> AnyPublisher<ResultState<ClientListMemberState, ErrorDisplayable>, Never> {
        let storedValue = self.store.clientListsPublisher
            .compactMap { $0?.getList(id: clientListId) }
            .map { clientList -> ClientListMemberState in
                switch clientList.mode {
                case .classic(let members, _, _):
                    return members == nil ? .partial(clientList.listInfo) : .total(clientList)
                case .tabbed(let tabs):
                    return tabs == nil ? .partial(clientList.listInfo) : .total(clientList)
                }
            }

        let request = self.store.fetchClientListMembers(clientListId: clientListId, tabID: tabID, sortBy: sortBy, cursor: cursor)
            // We should be able to filter here by `isSuccess` but at the moment
            // when we create an empty list and then retrieve it, it doesn't return a
            // key for "members".
            // .filter { !$0.isSuccess }
            .tryMap { result -> ClientListMemberState in
                switch result {
                case .failure(let error):
                    throw error
                case .success(let clientList):
                    return .total(clientList)
                }
            }.catch { [store] error in
                return store.clientListsPublisher
                    .compactMap { $0?.getList(id: clientListId) }
                    .map { ClientListMemberState.error($0.listInfo, error) }
            }

        let requests = request.merge(with: storedValue)
            .map { state -> ResultState<ClientListMemberState, ErrorDisplayable> in
                return .found(state)
        }

        return Just(.loading(nil))
            .merge(with: requests)
            .eraseToAnyPublisher()
    }

    public func fetchAllClientListMembers(clientListId: ListID) -> AnyPublisher<ResultState<[ClientMemberDisplayable], ErrorDisplayable>, Never> {
        let underlying = self.store.fetchAllClientListMembers(clientListId: clientListId)
            .map { return ResultState.fromResult(result: $0) }
            .catch { error in
                return Just(.failed(ErrorDisplayable(error)))
            }
        return Just(.loading(nil))
            .merge(with: underlying)
            .eraseToAnyPublisher()
    }

    public func deleteClientListMember(listId: ListID, memberId: String) -> AnyPublisher<Result<Void, ErrorDisplayable>, Never> {
        return self.store
            .deleteClientListMember(listId: listId, memberId: memberId)
            .catch { error in
                return Just(.failure(ErrorDisplayable(error)))
        }.eraseToAnyPublisher()
    }

    public func upsertClientList(listId: ListID?, listName: String, clientIds: [String]) -> ClientListDisplayableResultPublisher {
        return self.store.upsertClientList(listId: listId, listName: listName, clientIds: clientIds)
    }

    public func getMainClientListsNavigationActions() -> AnyPublisher<[MenuAction], Never> {
        return self.store.getMainClientListsNavigationActions()
    }
}

private extension ClientListSection {
    func getList(id: ListID) -> ClientListDisplayable? {
        return (self.featured.clientLists + self.personal.clientLists).first(where: { $0.id == id })
    }
}
