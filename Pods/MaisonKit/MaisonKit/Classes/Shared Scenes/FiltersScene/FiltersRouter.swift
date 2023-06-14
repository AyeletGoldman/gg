// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A router for the filters scene
public protocol FiltersRouter {

    /// Presents filter details screen. for example nested selection screen
    /// - Parameters:
    ///   - scene: The scene to present
    func presentFilterDetails(scene: AnyScene)
}

public final class DefaultFiltersRouter: Router<FiltersViewController>, FiltersRouter {

    public func presentFilterDetails(scene: AnyScene) {
        let controller = self.factory.createViewController(scene)
        self.presentModally(controller)
    }
}
