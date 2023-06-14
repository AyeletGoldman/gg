// Copyright © 2022 LVMH. All rights reserved.

import Foundation

/// A router for the `ChooseAssetsScene`.
protocol ChooseAssetsRouter {
    /// Presents the camera view so the user can take a picture or video.
    /// - Parameters:
    ///   - onMediaSaved: a closure to invoke when the presented scene has finished saving the new media.
    ///   The parameter for this closure is the `localIdentifier` of the newly-created `PHAsset`.
    func presentMediaScreen(onMediaSaved: @escaping (String) -> Void)
}

final class DefaultChooseAssetsRouter: Router<ChooseAssetsViewController>, ChooseAssetsRouter {

    func presentMediaScreen(onMediaSaved: @escaping (String) -> Void) {
        let scene = self.factory.retrieveScene(with: CameraRouteDescriptor(onMediaSaved: { controller, identifier in
            controller.dismiss(animated: true, completion: nil)
            onMediaSaved(identifier)
        },
                                                                           onCancel: { controller in
            controller.dismiss(animated: true, completion: nil)
        }))
        let controller = self.factory.createViewController(scene)
        // We don't use the convenience function (`self.presentModally`) here, because the CameraScene has an in-built navigation controller
        self.controller?.present(controller, animated: true)
    }
}
