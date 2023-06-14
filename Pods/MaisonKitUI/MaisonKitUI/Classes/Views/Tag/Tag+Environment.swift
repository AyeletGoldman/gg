// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension EnvironmentValues {
    var tagStyle: any TagStyle {
        get { self[TagStyleKey.self] }
        set { self[TagStyleKey.self] = newValue }
    }
}

struct TagStyleKey: EnvironmentKey {
    static var defaultValue: any TagStyle = PrimaryTagStyle()
}

public extension View {

    /// Sets the style for `Tag`s within this view to a tag style with a
    /// custom appearance and custom interaction behavior.
    ///
    /// Use this modifier to set a specific style for block instances
    /// within a view:
    ///
    ///     HStack {
    ///         Tag(title: "Value")
    ///         Tag(title: "Value")
    ///     }
    ///     .tagStyle(.primary)
    ///
    /// - Parameter style: the style to apply to the tags in this view
    /// - Returns: this view, with the environment modified to include the given style
    func tagStyle<S: TagStyle>(_ style: S) -> some View {
        self.environment(\.tagStyle, style)
    }
}
