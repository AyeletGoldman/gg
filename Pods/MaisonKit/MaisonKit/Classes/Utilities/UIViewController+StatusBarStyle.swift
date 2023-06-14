// Copyright © 2022 LVMH. All rights reserved.

import UIKit
import StylableSwiftUI

protocol StylableStatusBarController: UIViewController {
    var stylablePreferredStatusBarStyle: UIStatusBarStyle { get }
    var styleContainer: UIKitStyleContainer { get }
    var stylistPath: StylistIdentifier.Path { get }
    var stylistSection: String? { get }
}

extension StylableStatusBarController {
    var preferredStatusBarStyle: UIStatusBarStyle {
        return self.stylablePreferredStatusBarStyle
    }
}

extension StylableStatusBarController {
    /// Uses the stylist to get the status bar colour
    /// Because colours for the status bar can only be either light or dark,
    /// We check if the colour in the stylist is white, and if it is then we use `.lightContent`
    /// we otherwise use `.darkContent`.
    var stylablePreferredStatusBarStyle: UIStatusBarStyle {
        let identifier = StylistIdentifier("status-bar/background").within(self.stylistPath)
        let color = self.styleContainer.backgroundColor(for: identifier)
        var white: CGFloat = 0.0
        color?.getWhite(&white, alpha: nil)
        return round(white) == 1 ? .lightContent : .darkContent
    }

    var stylistPath: StylistIdentifier.Path {
        let suffix = self.isModal ? "modal" : ""
        guard let section = self.stylistSection else {
            return StylistIdentifier.Path(suffix)
        }
        return StylistIdentifier.Path("\(section)/\(suffix)")
    }
}
