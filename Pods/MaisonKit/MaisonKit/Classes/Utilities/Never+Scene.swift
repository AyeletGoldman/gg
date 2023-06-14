// Copyright © 2021 LVMH. All rights reserved.

import Foundation

extension Never: Scene {
    public func createViewController() -> UIViewController {
        fatalError("`Never` does not create a view controller")
    }

    public func configure(controller: UIViewController, using factory: SceneFactory) {
        fatalError("`Never` cannot configure a view controller")
    }
}
