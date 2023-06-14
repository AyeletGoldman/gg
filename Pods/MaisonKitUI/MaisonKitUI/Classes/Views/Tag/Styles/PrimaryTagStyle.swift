// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// The primary tag style.
public struct PrimaryTagStyle: TagStyle {

    /// Creates a new `PrimaryTagStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        self.buildDefaultLayout(configuration: configuration,
                                variant: configuration.variant,
                                padded: configuration.padded)
    }
}

public extension TagStyle where Self == PrimaryTagStyle {

    /// Convenience var to create a new `TagStyle` of type `PrimaryTagStyle`
    static var primary: some TagStyle { return PrimaryTagStyle() }
}
