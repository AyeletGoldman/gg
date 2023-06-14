// Copyright © 2021 LVMH. All rights reserved.

import Foundation

extension UIViewController {

    var isModal: Bool {
        let presentingIsModal = self.presentingViewController != nil
        let presentingIsNavigation = self.navigationController?.presentingViewController?.presentedViewController == self.navigationController
            && self.navigationController != nil
        let presentingIsTabBar = self.tabBarController?.presentingViewController is UITabBarController
        let isFullScreen = (self.navigationController?.modalPresentationStyle == .fullScreen ||
                            self.modalPresentationStyle == .fullScreen ||
                            self.tabBarController?.presentationController?.presentationStyle == .fullScreen)

        return (presentingIsModal || presentingIsNavigation || presentingIsTabBar) && !isFullScreen
    }
}
