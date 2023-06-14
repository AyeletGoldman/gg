// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import MessageUI

/// The route descriptor for the SMS composer scene
public struct SMSComposerRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "SMSComposerRouteDescriptor"

    /// The data of the message to be sent
    public let messageData: MessageData

    /// Closure invoked when the user has finished sending the message
    public let onDone: (UIViewController, CancellableResult) -> Void

    /// Creates an instance of `SMSComposerRouteDescriptor`
    /// - Parameters:
    ///   - messageData: The data of the message to be sent
    ///   - onDone: Closure invoked when the user has finished sending the message
    public init(messageData: MessageData, onDone: @escaping (UIViewController, CancellableResult) -> Void) {
        self.messageData = messageData
        self.onDone = onDone
    }
}
