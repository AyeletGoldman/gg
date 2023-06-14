// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// A `ContextualAction` used in UIMenus
public typealias MenuAction = ContextualAction

extension MenuAction {
    static func buildIdentifier(withToken token: String) -> StylistIdentifier {
        return StylistIdentifier("pulldown/pulldown-item/" + token)
    }
}
