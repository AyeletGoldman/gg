// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the client 360 screen
public struct Client360RouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "Client360RouteDescriptor"

    /// The ID for the client that will be displayed in the screen
    public let clientId: String
    /// The name of the client, usually used as the title of the screen
    public let clientName: String?
    /// A closure to call when this descriptor has been presented modally and the user taps the "close" button.
    public let onClose: ((UIViewController) -> Void)?

    /// Creates a new `Client360RouteDescriptor`
    /// - Parameters:
    ///   - clientID: The ID for the client that will be displayed in the screen
    ///   - clientName: The name of the client, usually used as the title of the screen
    ///   - onClose: A closure to call when this descriptor has been presented modally and the user taps the "close" button.
    public init(clientID: String,
                clientName: String? = nil,
                onClose: ((UIViewController) -> Void)? = nil) {
        self.clientId = clientID
        self.clientName = clientName
        self.onClose = onClose
    }
}
