// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A displayable type used to display data on a list of clients from a search context
public struct ClientSearchRowDisplayable: Identifiable {

    /// The ID of this client.
    public var id: String {
        return self.cellProvider.clientID
    }
    /// The row information to display for this client in a list
    public let cellProvider: ClientCellProvider

    /// Creates a new `ClientSearchRowDisplayable`.
    /// This initializer creates a displayable that will display the default cell for client list search members.
    /// - Parameter cellProvider: A structure that will provide the view that will be shown for search results.
    public init(cellProvider: ClientCellProvider) {
        self.cellProvider = cellProvider
    }
}
