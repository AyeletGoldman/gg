// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension EnvironmentValues {
    var badgeStyle: AnyBadgeViewStyle {
        get { self[BadgeViewStyleKey.self] }
        set { self[BadgeViewStyleKey.self] = newValue }
    }
}

struct BadgeViewStyleKey: EnvironmentKey {
    static var defaultValue = AnyBadgeViewStyle(style: PrimaryBadgeViewStyle())
}
