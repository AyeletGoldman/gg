// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension EnvironmentValues {
    var picklistStyle: any FormTypePicklistStyle {
        get { self[FormTypePicklistStyleKey.self] }
        set { self[FormTypePicklistStyleKey.self] = newValue }
    }
}

struct FormTypePicklistStyleKey: EnvironmentKey {
    static var defaultValue: any FormTypePicklistStyle = DefaultFormTypePicklistStyle()
}

public extension View {

    /// Sets the style for `FormTypePicklist`s within this view to a picklist style with a
    /// custom appearance and custom interaction behavior.
    ///
    /// Use this modifier to set a specific style for picklist instances
    /// within a view:
    ///
    ///     HStack {
    ///         ... picklists here
    ///     }
    ///     .formTypePicklistStyle(.default)
    ///
    /// - Parameter style: the style to apply to the picklists in this view
    /// - Returns: this view, with the environment modified to include the given style
    func formTypePicklistStyle<S: FormTypePicklistStyle>(_ style: S) -> some View {
        self.environment(\.picklistStyle, style)
    }
}
