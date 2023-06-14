// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A router for the product details scene
public protocol ProductCuratorRouter: ActionScenePresenterRouter {
    /// Presents the  choose assets scene
    /// - Parameters:
    ///   - getAssetsClosure: A closure to get a publisher with assets to choose in Choose Assets screen
    ///   - saveSelectedAssetsClosure: A closure for saving the selected assets in Choose Assets screen
    func presentChoosePhotos(getAssetsClosure: @escaping GetAssetsClosure,
                             saveSelectedAssetsClosure: @escaping SaveSelectedAssetsClosure)
}

final class DefaultProductCuratorRouter: Router<ProductCuratorViewController>,
                                         ProductCuratorRouter,
                                         DefaultActionScenePresenterRouter {
    func presentChoosePhotos(getAssetsClosure: @escaping GetAssetsClosure,
                             saveSelectedAssetsClosure: @escaping SaveSelectedAssetsClosure) {
        let scene = self.factory.retrieveScene(with: ChooseAssetsRouteDescriptor(getAssetsClosure: getAssetsClosure,
                                                                                 saveSelectedAssetsClosure: saveSelectedAssetsClosure,
                                                                                 onClose: { controller in
            controller.dismiss(animated: true, completion: nil)
        }))
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
