// Copyright © 2023 LVMH. All rights reserved.

import Foundation

/// The route descriptor for the presentation of the client creation screen.
public struct CreateClientRouteDescriptor: RouteDescriptor {
    public static var identifier: Identifier = "CreateClientRouteDescriptor"

    /// A closure to invoke for dismissing the scene
    public let onDismiss: (UIViewController) -> Void

    /// Creates a new `CreateClientRouteDescriptor`
    /// - Parameter onDismiss: A closure to invoke for dismissing the scene
    public init(onDismiss: @escaping (UIViewController) -> Void) {
        self.onDismiss = onDismiss
    }
}
