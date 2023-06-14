// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

extension EnvironmentValues {
    var blockStyle: any BlockStyle {
        get { self[BlockStyleKey.self] }
        set { self[BlockStyleKey.self] = newValue }
    }
}

struct BlockStyleKey: EnvironmentKey {
    static var defaultValue: any BlockStyle = DefaultBlockStyle()
}

public extension View {

    /// Sets the style for `Block`s within this view to a block style with a
    /// custom appearance and custom interaction behavior.
    ///
    /// Use this modifier to set a specific style for block instances
    /// within a view:
    ///
    ///     HStack {
    ///         Block(title: "Value", subtitle: "Subtitle")
    ///         Block(title: "Value", subtitle: "Subtitle")
    ///     }
    ///     .blockStyle(.default)
    ///
    /// - Parameter style: the style to apply to the blocks in this view
    /// - Returns: this view, with the environment modified to include the given style
    func blockStyle<S: BlockStyle>(_ style: S) -> some View {
        self.environment(\.blockStyle, style)
    }
}
