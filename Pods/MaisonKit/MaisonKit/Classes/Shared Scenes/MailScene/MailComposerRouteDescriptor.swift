// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MessageUI

public struct MailComposerRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "MailComposerRouteDescriptor"

    /// A set of properties that can be used to construct an email
    public let emailData: EmailData
    /// The done closure to decide what to do when submitting or canceling the screen
    public let onDone: (UIViewController, CancellableResult) -> Void

    /// Creates a new `MailComposerRouteDescriptor`
    /// - Parameters:
    ///   - emailData: A set of properties that can be used to construct an email
    ///   - onDone: The done closure to decide what to do when submitting or canceling the screen
    public init(emailData: EmailData, onDone: @escaping (UIViewController, CancellableResult) -> Void) {
        self.emailData = emailData
        self.onDone = onDone
    }
}
