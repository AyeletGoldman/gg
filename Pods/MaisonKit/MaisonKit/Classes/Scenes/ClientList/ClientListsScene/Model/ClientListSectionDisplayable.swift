// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// A container to hold the lists displayed in a section as well as the title for that section
public struct ClientListSectionDisplayable {
    /// The lists of clients that this section holds
    public var clientLists: [ClientListDisplayable]
    /// The type of list this is. This is a human-readable value, usually used for reporting and analytics.
    public var listTypeIdentifier: String
    /// The title for this section
    public let title: String
    /// Creates a new `ClientListSectionDisplayable` with the given title and array of client lists
    /// - Parameters:
    ///   - title: the title of this client list to be displayed in the screen
    ///   - listTypeIdentifier: The type of list this is. This is a human-readable value, usually used for reporting and analytics.
    ///   - clientLists: the array of client lists that will be shown in this client list
    public init(title: String, listTypeIdentifier: String, clientLists: [ClientListDisplayable]) {
        self.title = title
        self.clientLists = clientLists
        self.listTypeIdentifier = listTypeIdentifier
    }
}
