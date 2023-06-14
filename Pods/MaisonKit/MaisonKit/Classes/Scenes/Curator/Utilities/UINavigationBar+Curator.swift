// Copyright © 2021 LVMH. All rights reserved.

import UIKit

extension NavigationButton {
    static func curatorButton(productCount: Int, onTap: @escaping () -> Void) -> NavigationButton {
        return NavigationButton(title: .image(.styledImage(identifier: "icon-cart")),
                                accessibilityIdentifier: "curator",
                                isEnabled: true,
                                badgeTitle: productCount == 0 ? nil : "\(productCount)",
                                action: onTap)
    }
}
