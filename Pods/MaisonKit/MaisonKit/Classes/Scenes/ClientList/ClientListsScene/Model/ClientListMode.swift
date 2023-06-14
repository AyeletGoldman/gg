// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// The mode a list is in. Will be `.classic` if the members list displays no tabs and should show just one list, or `.tabbed` if there are tabs.
public enum ClientListMode {
    /// A tabbed client list. This will contain the array of tabs to be displayed.
    /// A maximum of 3 tabs is recommended.
    case tabbed(tabs: [ClientMemberListTab]?)
    /// Contains the members in the list and the list cursor
    /// The cursor for the list. Cursors are used to aid in pagination. If the value here is non-nil, the client lists will assume there are more
    /// pages to be loaded and will return this cursor when requesting the next page. To disable pagination, pass `nil` here. If you have reached the last page, pass `nil` here.
    case classic(members: [ClientMemberDisplayable]?, currentListCursor: String?, totalNumberOfClients: Int?)
}
