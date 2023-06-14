// Copyright © 2022 LVMH. All rights reserved.

import Foundation

public extension ClientSearchRowDisplayable {
    /// Creates a new `ClientSearchRowDisplayable`.
    /// - Parameters:
    ///   - id: The ID of the client. This ID is used when a user taps on the cell and we want to load details for the client or
    ///   - clientName: the name of the client. This is used when showing confirmation alerts and other types of interaction that require the client's name
    ///   - client: a displayable row that will be used to build the view that will display the client
    ///   - quickActions: a list of possible QuickActions that can be performed on the client
    init(id: String, clientName: String, client: MemberRowDisplayable, quickActions: [MenuAction] = []) {
        self.init(cellProvider: ClientCellProvider(clientID: id, clientName: clientName, cellCreation: { MemberRowView(client: client) }, quickActions: quickActions))
    }
}
