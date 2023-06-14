//  Copyright © 2022 LVMH. All rights reserved.

public struct EditClientRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "EditClientRouteDescriptor"

    /// The ID of the client we want to edit
    public let clientID: String
    /// A closure to call when this descriptor has been presented modally and the user taps the "Cancel" button.
    public let onCancel: (UIViewController) -> Void
    /// A closure to call after the client has been successfully updated
    public let onSuccess: (UIViewController) -> Void

    /// Creates a new `EditClientRouteDescriptor`
    /// - Parameters:
    ///   - clientID: The ID of the client we want to edit
    ///   - onCancel: A closure to call when this descriptor has been presented modally and the user taps the "Cancel" button.
    ///   - onSuccess: A closure to call after the client has been successfully updated
    public init(clientID: String,
                onCancel: @escaping (UIViewController) -> Void,
                onSuccess: @escaping (UIViewController) -> Void) {
        self.clientID = clientID
        self.onCancel = onCancel
        self.onSuccess = onSuccess
    }
}
