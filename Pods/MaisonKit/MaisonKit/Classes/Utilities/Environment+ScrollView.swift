// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

struct ScrollProxy: EnvironmentKey {
    static var defaultValue: ScrollViewProxy?
}

extension EnvironmentValues {
    var scrollViewProxy: ScrollViewProxy? {
        get {
            return self[ScrollProxy.self]
        }
        set {
            self[ScrollProxy.self] = newValue
        }
    }
}
