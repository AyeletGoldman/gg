// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import UIKit

struct UnimplementedScene: Scene {

    func createViewController() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = UIColor.systemPink
        return controller
    }

    func configure(controller: UIViewController,
                   using factory: SceneFactory) { }
}
