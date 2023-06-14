// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// An object that is used to create a cell for display in a client list
public struct ClientCellProvider {
    /// A client ID. This is the ID of the client that will be represented in the cell that is created by `cellCreation`
    public let clientID: String
    /// The client name. This is the name of the client that will be shown in different parts of the flow, for example when
    /// a user wants to delete a client and we want to show a confirmation alert.
    public let clientName: String
    /// A closure that will be used to create the view that will be shown in the client list cell
    public let cellCreation: () -> any View
    /// The list of actions that the user is provided with on long press
    public let quickActions: [MenuAction]

    /// Creates a new `CellProvider`
    /// - Parameters:
    ///   - clientID: A client ID. This is the ID of the client that will be represented in the cell that is created by `cellCreation`
    ///   - clientName: The client name. This is the name of the client that will be shown in different parts of the flow, for example when
    ///   a user wants to delete a client and we want to show a confirmation alert.
    ///   - cellCreation: A closure that will be used to create the view that will be shown in the client list cell.
    ///   - quickActions: An array of actions to be displayed in the cell after a long-press by the user.
    public init(clientID: String, clientName: String, cellCreation: @escaping () -> any View, quickActions: [MenuAction] = []) {
        self.clientID = clientID
        self.clientName = clientName
        self.cellCreation = cellCreation
        self.quickActions = quickActions
    }
}
