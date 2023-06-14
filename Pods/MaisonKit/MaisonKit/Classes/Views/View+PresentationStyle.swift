// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

struct ModalPresentationStyle: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var isModalPresentationStyle: Bool {
        get {
            return self[ModalPresentationStyle.self]
        }
        set {
            self[ModalPresentationStyle.self] = newValue
        }
    }
}
