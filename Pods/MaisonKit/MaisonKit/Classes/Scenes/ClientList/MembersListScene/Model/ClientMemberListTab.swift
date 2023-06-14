// Copyright © 2023 LVMH. All rights reserved.

import Foundation

public struct ClientMemberListTab: Identifiable {
    /// The name, or title, for this tab
    public let name: String
    /// The ID for the tab. This is used to request extra members after paginating.
    public let id: String
    /// The members included in this tab.
    public var members: [ClientMemberDisplayable]
    /// The cursor for the tab. Cursors are used to aid in pagination. If the value here is non-nil, the client lists will assume there are more
    /// pages to be loaded and will return this cursor when requesting the next page. To disable pagination, pass `nil` here. If you have reached the last page, pass `nil` here.
    public var currentTabCursor: String?
    /// The total number of clients in this tab
    public let totalNumberOfClients: Int

    /// Creates a new `ClientMemberListTab`.
    /// - Parameters:
    ///   - id: The ID for the tab. This is used to request extra members after paginating.
    ///   - name: The name, or title, for this tab
    ///   - members: he members included in this tab.
    ///   - currentTabCursor: The cursor for the tab. Cursors are used to aid in pagination. If the value here is non-nil,
    ///   the client lists will assume there are more pages to be loaded and will return this cursor when requesting the next page.
    ///   To disable pagination, pass `nil` here. If you have reached the last page, pass `nil` here.
    ///   - totalNumberOfClients: the total number of clients in this tab
    public init(id: String,
                name: String,
                members: [ClientMemberDisplayable],
                currentTabCursor: String?,
                totalNumberOfClients: Int) {
        self.id = id
        self.name = name
        self.members = members
        self.currentTabCursor = currentTabCursor
        self.totalNumberOfClients = totalNumberOfClients
    }
}
