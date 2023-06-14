// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// The default block style. Displays a vertical stack of title and subtitle.
public struct DefaultBlockStyle: BlockStyle {

    /// Creates a new `DefaultBlockStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.title
            configuration.subtitle
        }
    }
}

public extension BlockStyle where Self == DefaultBlockStyle {

    /// Convenience var to create a new `BlockStyle` of type `DefaultBlockStyle`
    static var `default`: some BlockStyle { return DefaultBlockStyle() }
}
