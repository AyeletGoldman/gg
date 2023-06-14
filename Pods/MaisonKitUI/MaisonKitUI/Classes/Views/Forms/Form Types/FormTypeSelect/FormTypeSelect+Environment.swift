// Copyright © 2023 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension EnvironmentValues {
    var formTypeSelectStyle: any FormTypeSelectStyle {
        get { self[FormTypeSelectStyleKey.self] }
        set { self[FormTypeSelectStyleKey.self] = newValue }
    }
}

struct FormTypeSelectStyleKey: EnvironmentKey {
    static var defaultValue: any FormTypeSelectStyle = DefaultFormTypeSelectStyle()
}

public extension View {

    /// Sets the style for `FormTypeSelect`s within this view to a styled view with a
    /// custom appearance and custom interaction behavior.
    ///
    /// Use this modifier to set a specific style for `FormTypeSelect` instances within a view:
    ///
    ///     VStack {
    ///         ... `FormTypeSelect` here
    ///     }
    ///     .formTypeSelectStyle(.default)
    ///
    /// - Parameter style: the style to apply to the `formTypeSelect` in this view
    /// - Returns: this view, with the environment modified to include the given style
    func formTypeSelectStyle<S: FormTypeSelectStyle>(_ style: S) -> some View {
        self.environment(\.formTypeSelectStyle, style)
    }
}
