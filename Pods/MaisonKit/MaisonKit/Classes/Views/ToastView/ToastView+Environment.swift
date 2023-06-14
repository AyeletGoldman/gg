// Copyright © 2021 LVMH. All rights reserved.

import SwiftUI

extension EnvironmentValues {
    var toastStyle: AnyToastViewStyle {
        get { self[ToastViewStyleKey.self] }
        set { self[ToastViewStyleKey.self] = newValue }
    }
}

struct ToastViewStyleKey: EnvironmentKey {
    static var defaultValue = AnyToastViewStyle(style: DefaultToastViewStyle())
}
