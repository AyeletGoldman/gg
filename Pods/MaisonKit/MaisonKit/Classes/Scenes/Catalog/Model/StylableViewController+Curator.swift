// Copyright © 2021 LVMH. All rights reserved.

import UIKit

extension StylableViewController {
    func addCuratorBarButtonIfNeeded(productCount: Int, onTap: @escaping () -> Void) {
        if Features.manager.isEnabled(.productCurator) {
            let curatorButton = NavigationButton.curatorButton(productCount: productCount, onTap: onTap)
            self.addRightBarButtonItem(curatorButton)
        }
    }
}
