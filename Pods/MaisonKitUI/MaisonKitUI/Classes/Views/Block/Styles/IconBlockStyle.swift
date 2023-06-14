// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// The default icon block style. Displays only an icon of 40x40 dimensions.
public struct IconBlockStyle: BlockStyle {

    /// Creates a new `IconBlockStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        configuration.icon.frame(width: 40, height: 40)
    }
}

public extension BlockStyle where Self == IconBlockStyle {

    /// Convenience var to create a new `BlockStyle` of type `IconBlockStyle`
    static var icon: some BlockStyle { return IconBlockStyle() }
}
