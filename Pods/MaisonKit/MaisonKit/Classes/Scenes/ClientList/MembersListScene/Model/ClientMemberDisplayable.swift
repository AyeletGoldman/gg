// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A displayable to show a client's information in a list-row
public struct ClientMemberDisplayable {
    /// The client's ID in this list e.g. a unique ID that identifies this client in this list.
    public let listMemberId: String
    /// The information to display about this client
    public let cellProvider: ClientCellProvider

    /// Creates a new `ClientMemberDisplayable` with the given ID and `MemberRowDisplayable` to present.
    /// This initializer creates a displayable that will display the default cell for client list members.
    /// - Parameter listMemberID: The ID of this client in this list. This is a way to identify a particular member in a particular list.
    /// It is not the ID of the client or the ID of the list, it's an ID that combines them both.
    /// - Parameter client: The row information to display for this client in a list
    /// - Parameter quickActions: A list of actions to be displayed in the contextual menu that gets triggered by a long press
    public init(listMemberID: String, client: MemberRowDisplayable, quickActions: [MenuAction] = []) {
        self.init(listMemberID: listMemberID,
                  clientID: client.id,
                  clientName: client.title,
                  quickActions: quickActions,
                  clientCell: { MemberRowView(client: client) })
    }

    /// Creates a new `ClientMemberDisplayable` with the
    /// - Parameters:
    ///   - listMemberID: The ID of this client in this list. This is a way to identify a particular member in a particular list.
    ///   It is not the ID of the client or the ID of the list, it's an ID that combines them both.
    ///   - clientID: A client ID. This is the ID of the client that will be represented in the cell that is created by `cellCreation`
    ///   - clientName: The client name. This is the name of the client that will be shown in different parts of the flow, for example when
    ///   a user wants to delete a client and we want to show a confirmation alert.
    ///   - quickActions: A list of actions to be displayed in the contextual menu that gets triggered by a long press
    ///   - clientCell: a closure that will be used to create the view that will be shown in the client list cell
    public init<V: View>(listMemberID: String, clientID: String, clientName: String, quickActions: [MenuAction] = [], clientCell: @escaping () -> V) {
        self.listMemberId = listMemberID
        self.cellProvider = ClientCellProvider(clientID: clientID, clientName: clientName, cellCreation: clientCell, quickActions: quickActions)
    }
}
