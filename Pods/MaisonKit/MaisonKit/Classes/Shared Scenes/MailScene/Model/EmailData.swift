// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MessageUI

struct Mail {
    static var canSendMail: Bool {
        return MFMailComposeViewController.canSendMail()
    }
}

/// A set of properties that can be used to construct an email
public struct EmailData {
    let emails: [String]?
    let subject: String?
    let body: String?
    let isBodyHtml: Bool

    /// Creates a new `EmailData` object
    /// - Parameters:
    ///   - emails: the recipients of the email
    ///   - subject: a subject for the email
    ///   - body: the body of the email, this is a string that can be HTML or plain text
    ///   - isBodyHtml: whether the body is HTML or not
    public init(emails: [String]? = nil, subject: String? = nil, body: String? = nil, isBodyHtml: Bool = false) {
        self.emails = emails
        self.subject = subject
        self.body = body
        self.isBodyHtml = isBodyHtml
    }
}
