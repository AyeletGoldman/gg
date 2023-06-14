//  Copyright © 2023 LVMH. All rights reserved.

/// The route descriptor for confirming a set of changes to the profile of a client
public struct EditClientConfirmationRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "EditClientConfirmationRouteDescriptor"

    /// The ID of the client whose data we are confirming
    public let clientID: String
    /// The modified data for a client
    public let data: AnyFormData
    /// A closure to invoke when the data has been successfully saved
    public let onSuccess: () -> Void

    /// Creates a new `EditClientConfirmationRouteDescriptor`
    /// - Parameters:
    ///   - clientID: The ID of the client whose data we are confirming
    ///   - data: The modified data for a client
    ///   - onSuccess: A closure to invoke when the data has been successfully saved
    public init(clientID: String, data: AnyFormData, onSuccess: @escaping () -> Void) {
        self.clientID = clientID
        self.data = data
        self.onSuccess = onSuccess
    }
}
