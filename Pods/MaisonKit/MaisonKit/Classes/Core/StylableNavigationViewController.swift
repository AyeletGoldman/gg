// Copyright © 2021 LVMH. All rights reserved.

import UIKit

/// The default UINavigationController used in MaisonKit
open class StylableNavigationController: UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
