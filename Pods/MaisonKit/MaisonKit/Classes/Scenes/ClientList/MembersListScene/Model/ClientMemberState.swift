// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A model to represent the state of a client list member's screen.
/// Client list member screens can be either fully or partially loaded, or they can be in an error state.
/// Each state has associated data with it that can be displayed to the user.
public enum ClientListMemberState {
    /// The error state. Has some partial information about the client list and an error to display to the user.
    case error(ClientListDisplayable.ListInfo, Error)
    /// The partially-loaded state. Used while we are retrieving the full details of the list. Has some partial information about the client list.
    case partial(ClientListDisplayable.ListInfo)
    /// The fully-loaded client list. Has all details available.
    case total(ClientListDisplayable)

    var listName: String {
        switch self {
        case .error(let listInfo, _), .partial(let listInfo):
            return listInfo.title
        case .total(let displayable):
            return displayable.listInfo.title
        }
    }

    var isEditable: Bool {
        switch self {
        case .error(let listInfo, _), .partial(let listInfo):
            return listInfo.isEditable
        case .total(let displayable):
            return displayable.listInfo.isEditable
        }
    }

    var sortItems: [SortItem] {
        switch self {
        case .error, .partial: return []
        case .total(let displayable):
            return displayable.sortItems ?? []
        }
    }

    var selectedSortValue: String? {
        switch self {
        case .error, .partial: return nil
        case .total(let displayable):
            return displayable.selectedSortValue
        }
    }

    var mode: ClientListMode {
        switch self {
        case .error, .partial:
            return .classic(members: [], currentListCursor: nil, totalNumberOfClients: nil)
        case .total(let displayable):
            return displayable.mode
        }
    }

    var hasMembers: Bool {
        switch self.mode {
        case .tabbed(let tabs):
            guard let tabs else { return false }
            if tabs.isEmpty { return false }
            return !tabs.allSatisfy { $0.members.isEmpty }
        case .classic(let members, _, _):
            guard let members else { return false }
            return !members.isEmpty
        }
    }
}
