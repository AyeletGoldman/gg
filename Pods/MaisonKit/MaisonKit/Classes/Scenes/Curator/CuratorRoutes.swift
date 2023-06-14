// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// This class is automatically invoked when a user calls `MaisonKit.initialize()`
@objc private final class CuratorRoutes: NSObject, RouteRegistering {
    /// Registers all product catalog routes.
    /// - Parameter registry: a `SceneRegistry` to register the routes onto.
    static func registerRoutes(onto registry: SceneRegistry) {
        registry.registerScene { (descriptor: ProductCuratorRouteDescriptor) in
            return ProductCuratorScene(onClose: descriptor.onClose)
        }

        registry.registerScene { (descriptor: ChooseAssetsRouteDescriptor) in
            return ChooseAssetsScene(getAssetsClosure: descriptor.getAssetsClosure,
                                     saveSelectedAssetsClosure: descriptor.saveSelectedAssetsClosure,
                                     onClose: descriptor.onClose)
        }

        registry.registerScene { (descriptor: CameraRouteDescriptor) in
            return CameraScene(onMediaSaved: descriptor.onMediaSaved,
                               onCancel: descriptor.onCancel)
        }
    }
}
