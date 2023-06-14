// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension EnvironmentValues {
    var filterButtonStyle: AnyFilterButtonStyle {
        get { return self[FilterButtonKey.self] }
        set { self[FilterButtonKey.self] = newValue }
    }
}

struct FilterButtonKey: EnvironmentKey {
    static let defaultValue: AnyFilterButtonStyle = AnyFilterButtonStyle(PlainFilterButtonStyle())
}
