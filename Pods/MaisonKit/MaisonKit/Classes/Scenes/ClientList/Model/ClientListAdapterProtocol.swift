// Copyright © 2020 LVMH. All rights reserved.

import Combine

/// A protocol for a client list adapter. It allows MaisonKit to create, get and delete client lists, as well as getting and deleting members of client lists.
public typealias ClientListAdapter = ClientListRetriever & ClientListDeleter & ClientListCreator

/// A protocol to allow retrieving client lists and client list members.
public protocol ClientListRetriever {
    /// Retrieves all client lists for the currently logged-in user
    /// - Returns: a publisher that will resolve to a result object with either an error or a section of client lists
    func getClientLists() -> AnyPublisher<Result<ClientListSection, ErrorDisplayable>, Error>

    @available(*, deprecated, message: "Deprecated on version 0.23.0. Please implement `getClientListMembers(listId:tabID:sortBy:cursor:)` instead.")
    func getClientListMembers(listId: String, sortBy: SelectedSortValue?) -> ClientListDisplayableResultPublisher

    /// Retrieves members for the client list with the given ID, a tab ID if the list is in tabs and a cursor for pagination.
    /// - Parameters:
    ///   - listID: the list ID to be retrieved.
    ///   - tabID: the ID of the tab for which we want to load new members. Initially, this may be `nil` as we don't know if there
    ///   will be tabs or not when we request the data. However, after the first load, the tab ID may exist if we are loading the next page in a tab.
    ///   - sortBy: _optional_. A specified sort value to order members by
    ///   - cursor: _optional_. The cursor to use to aid in pagination. When a cursor is passed to the receiver, it should be used to fetch the page starting at that cursor.
    /// - Returns: a publisher that will resolve to a result object with either an error or a list of members
    func getClientListMembers(listID: String,
                              tabID: String?,
                              sortBy: SelectedSortValue?,
                              cursor: String?) -> ClientListDisplayableResultPublisher

    /// Retrieves all members for the client list with the given ID.
    /// This function is used during editing a client list when we need to request *all* members in a list so we can
    /// display them during search. 
    /// - Parameters:
    ///   - listID: the list ID to be retrieved.
    /// - Returns: a publisher that will resolve to a result object with either an error or a list of members
    func getAllClientListMembers(listID: String) -> AnyPublisher<Result<[ClientMemberDisplayable], ErrorDisplayable>, Error>
}

public extension ClientListRetriever {
    func getClientListMembers(listId: String, tabID: String?, sortBy: SelectedSortValue?, cursor: String?) -> ClientListDisplayableResultPublisher {
        return Fail(error: NotImplementedError()).eraseToAnyPublisher()
    }

    func getClientListMembers(listId: String, sortBy: SelectedSortValue?) -> ClientListDisplayableResultPublisher {
        return Fail(error: NotImplementedError()).eraseToAnyPublisher()
    }
}

/// A protocol to allow deleting client lists and client list members.
public protocol ClientListDeleter {
    /// Deletes a client list with the given list ID.
    /// - Parameter listId: the list ID to be deleted.
    /// - Returns: a publisher that will resolve to either an empty success or an error
    func deleteClientList(listId: String) -> VoidResultPublisher

    /// Deletes a member of a client list with the given list member ID.
    /// - Parameter memberId: the member ID of the list to be deleted
    /// - Returns: a publisher that will resolve to either an empty success or an error
    func deleteClientListMember(memberId: String) -> VoidResultPublisher
}

/// A protocol to allow creating of client lists with a given name and a list of member IDs.
public protocol ClientListCreator {

    /// Creates a new client list and returns the new list's information when it's created
    /// - Parameters:
    ///   - listId: Optional. A list ID to use to update instead of creating a new list.
    ///   - listName: the name of the list to be created
    ///   - listMemberIds: the list of members that will be added to the newly created list
    /// - Returns: a publisher whose output is the result that with success/failure and in the case of success the new client list.
    func upsertClientList(listId: String?, listName: String, listMemberIds: [String]) -> ClientListDisplayableResultPublisher

    /// Requests the actions to be displayed in the top-right corner of the main client lists view
    /// - Returns: A publisher whose output is an array of `MenuAction` objects to insert into the navigation view's trailing edge.
    // swiftlint:disable:next line_length
    @available(*, deprecated, message: "Deprecated on version 0.23.0. This function has been deprecated in favor of create client navigation button. This button is controlled by the feature flag `.createClient` and presents `CreateClientRouteDescriptor`.")
    func getMainClientListsNavigationActions() -> AnyPublisher<[MenuAction], Never>
}

public extension ClientListCreator {
    /// Default implementation to `getMainClientListsNavigationActions` until this function will be deleted
    /// - Returns: A publisher whose output is an empty array of `MenuAction` objects to insert into the navigation view's trailing edge.
    // swiftlint:disable:next line_length
    @available(*, deprecated, message: "Deprecated on version 0.23.0. This function has been deprecated in favor of create client navigation button. This button is controlled by the feature flag `.createClient` and presents `CreateClientRouteDescriptor`.")
    func getMainClientListsNavigationActions() -> AnyPublisher<[MenuAction], Never> {
        return Just([]).eraseToAnyPublisher()
    }
}
