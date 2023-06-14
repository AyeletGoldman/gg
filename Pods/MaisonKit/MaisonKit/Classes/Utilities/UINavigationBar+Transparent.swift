// Copyright © 2021 LVMH. All rights reserved.

import UIKit

extension UIViewController {
    func changeNavigationBarColor(to color: UIColor) {
        let appearance = self.getAppearance()
        if color == .clear {
            appearance.configureWithTransparentBackground()
        }
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = UIImage()
        appearance.backgroundColor = color
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }

    func changeBackButtonImage(to image: UIImage) {
        let appearance = self.getAppearance()

        appearance.setBackIndicatorImage(image, transitionMaskImage: image)

        self.navigationItem.standardAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }

    func setBackButtonTitleAttributes(_ attributes: [NSAttributedString.Key: Any]) {
        let appearance = self.getAppearance()
        appearance.backButtonAppearance.normal.titleTextAttributes = attributes
        appearance.backButtonAppearance.focused.titleTextAttributes = attributes
        appearance.backButtonAppearance.highlighted.titleTextAttributes = attributes
        appearance.backButtonAppearance.disabled.titleTextAttributes = attributes
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }

    private func getAppearance() -> UINavigationBarAppearance {
        if let appearance = self.navigationItem.standardAppearance?.copy() {
            return appearance
        }
        return UINavigationBar.appearance().standardAppearance.copy()
    }
}
