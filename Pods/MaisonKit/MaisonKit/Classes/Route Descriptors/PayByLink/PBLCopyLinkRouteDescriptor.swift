//  Copyright © 2021 LVMH. All rights reserved.

public struct PBLCopyLinkRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "PBLCopyLinkRouteDescriptor"

    public let orderId: String
    /// A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    public let onDone: (UIViewController) -> Void

    public init(orderId: String, onDone: @escaping (UIViewController) -> Void) {
        self.orderId = orderId
        self.onDone = onDone
    }
}
