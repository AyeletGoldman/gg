// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the `CreateClientLists` screen.
public struct CreateClientListsRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "CreateClientListsRouteDescriptor"

    /// A closure to invoke when the user has finished creating a client list
    public let onDone: (UIViewController) -> Void

    /// Creates a new `CreateClientListsRouteDescriptor`
    /// - Parameter onDone: A closure to invoke when the user has finished creating a client list
    public init(onDone: @escaping (UIViewController) -> Void) {
        self.onDone = onDone
    }
}
