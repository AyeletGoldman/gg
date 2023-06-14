//  Copyright © 2021 LVMH. All rights reserved.

public struct PBLConfirmOrderRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "PBLConfirmOrderRouteDescriptor"

    public let orderId: String
    /// A closure to invoke when the user wants to dismiss the scene presented by this descriptor.
    public let onClose: (UIViewController) -> Void

    public let onShareCompletion: (UIViewController) -> Void

    public init(orderId: String,
                onClose: @escaping (UIViewController) -> Void,
                onShareCompletion: @escaping (UIViewController) -> Void) {
        self.orderId = orderId
        self.onClose = onClose
        self.onShareCompletion = onShareCompletion
    }
}
