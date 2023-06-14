//  Copyright © 2021 LVMH. All rights reserved.

/// The route descriptor for presenting the notifications permissions scene
public struct NotificationsPermissionsRouteDescriptor: RouteDescriptor {

    /// The identifier for this route descriptor
    public static let identifier: Identifier = "NotificationsPermissionsRouteDescriptor"

    /// A closure to pass into the scene. The two parameters in the closure are the view controller that presents the scene and
    /// a boolean indicating whether the user cancelled the flow.
    public let onDone: (UIViewController, Bool) -> Void

    /// Creates a new `NotificationsPermissionsRouteDescriptor`.
    /// - Parameter onDone: A closure to pass into the scene. The two parameters in the closure are the view controller that presents the scene and
    ///                     a boolean indicating whether the user cancelled the flow.
    public init(onDone: @escaping (UIViewController, Bool) -> Void) {
        self.onDone = onDone
    }
}
