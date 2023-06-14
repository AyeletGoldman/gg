//  Copyright © 2021 LVMH. All rights reserved.

/// The route descriptor that is linked to the product curator Scene.
public struct ProductCuratorRouteDescriptor: RouteDescriptor {
    public static let identifier: Identifier = "ProductCuratorRouteDescriptor"

    public let onClose: (UIViewController) -> Void

    public init(onClose: @escaping (UIViewController) -> Void) {
        self.onClose = onClose
    }
}
