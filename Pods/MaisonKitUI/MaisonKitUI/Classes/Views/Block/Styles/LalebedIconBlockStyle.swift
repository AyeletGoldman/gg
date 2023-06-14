// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// The default labeled icon block style. Displays a vertical stack of icon and subtitle.
/// The icon is constrained to a size of 20pt x 20pt.
public struct LabeledIconBlockStyle: BlockStyle {

    /// Creates a new `LabeledIconBlockStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon.frame(width: 20, height: 20)
            configuration.subtitle
        }
    }
}

public extension BlockStyle where Self == LabeledIconBlockStyle {

    /// Convenience var to create a new `BlockStyle` of type `LabeledIconBlockStyle`
    static var labeledIcon: some BlockStyle { return LabeledIconBlockStyle() }
}
