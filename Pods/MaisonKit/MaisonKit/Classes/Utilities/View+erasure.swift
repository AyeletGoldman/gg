// Copyright © 2020 LVMH. All rights reserved.

import SwiftUI

public extension View {
    /// Turns a view into AnyView, unless view is already an AnyView in which case it just returns view
    /// - Returns: this view wrapped in `AnyView` if it is not an `AnyView` already
    func eraseToAnyView() -> AnyView {
        if let anySelf = self as? AnyView {
            return anySelf
        }
        return AnyView(self)
    }
}
