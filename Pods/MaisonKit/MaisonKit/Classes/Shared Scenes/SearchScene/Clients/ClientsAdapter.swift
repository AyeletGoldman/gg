// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import Combine

/// An adapter that allows MaisonKit to search for clients by a text string
public protocol ClientsAdapter {

    /// Requests the implementer to search a client list for clients.
    /// - Parameters:
    ///   - pageIndex: the page number of results to be returned
    ///   - searchText: the text to search for
    ///   - clientListId: Optional. A client list ID to restrict the search only to that client list.
    /// - Returns: A publisher that, when resolved, will return a `Result` of either `[ClientSearchRowDisplayable]` or an `ErrorDisplayable`.
    func searchClients(pageIndex: Int,
                       searchText: String,
                       clientListId: String?) -> AnyPublisher<Result<[ClientSearchRowDisplayable], ErrorDisplayable>, Error>

    /// Defines the minimum number of search characters required for a search, if any
    /// - Returns: an integer that tells the caller how many characters are needed for a valid search
    func minimumNumberOfSearchCharacters() -> Int
}

/// Default implementation of the ClientsAdapter
public extension ClientsAdapter {
    // Default implementation returns`1` as the number of minimum characters required for a client search
    func minimumNumberOfSearchCharacters() -> Int {
        return 1
    }
}

extension ClientsAdapter {
    func searchClients(pageIndex: Int, searchText: String) -> AnyPublisher<Result<[ClientSearchRowDisplayable], ErrorDisplayable>, Error> {
        return self.searchClients(pageIndex: pageIndex, searchText: searchText, clientListId: nil)
    }
}
