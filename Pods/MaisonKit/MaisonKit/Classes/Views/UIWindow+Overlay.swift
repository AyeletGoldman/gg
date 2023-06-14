// Copyright © 2021 LVMH. All rights reserved.

import Foundation

extension UIWindow {
    func overlayNewController(_ controller: UIViewController) {
        // Create an empty view controller and set it as the root.
        // This makes it easy to "pretend" that the screen is being presented
        // modally from the current view controller, but instead we are taking
        // a whole new context in a new window and setting that up.
        // This allows us to present a new screen without having to care about where in the context of the app we are.
        let hostingController = UIViewController()
        self.rootViewController = hostingController
        self.makeKeyAndVisible()
        let navController = StylableNavigationController(rootViewController: controller)
        navController.modalPresentationStyle = .fullScreen
        hostingController.present(navController, animated: true, completion: nil)
    }
}
