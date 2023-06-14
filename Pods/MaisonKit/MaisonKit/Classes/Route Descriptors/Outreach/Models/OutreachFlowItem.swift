// Copyright © 2020 LVMH. All rights reserved.

import Foundation

/// A structure to hold the details of the outreach flow we are in.
public struct OutreachFlowItem {
    /// ID of the client associated to the outreach
    public let clientID: String
    /// The type of the outreach
    public let type: OutreachType
    /// The value of the recipient's address (email, phone number, screen name etc)
    public let recipient: String?

    /// Creates a new OutreachFlowItem
    /// - Parameters:
    ///   - clientID: ID of the client associated to the outreach
    ///   - type: the type of the outreach
    ///   - recipient: the recipient, usually an email or a phone number
    public init(clientID: String,
                type: OutreachType,
                recipient: String?) {
        self.clientID = clientID
        self.type = type
        self.recipient = recipient
    }
}
