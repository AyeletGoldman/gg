// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MessageUI

struct Messaging {
    static var canSendTextMessage: Bool {
        return MFMessageComposeViewController.canSendText()
    }
}

/// Holds the informations related to a message
public struct MessageData {
    let recipients: [String]
    let content: String

    /// Creates an instance of `MessageData`
    /// - Parameters:
    ///   - recipients: The recipients of the message
    ///   - content: The content of the message
    public init(recipients: [String] = [],
                content: String = "") {
        self.recipients = recipients
        self.content = content
    }
}
