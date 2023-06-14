// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// The secondary tag style.
public struct SecondaryTagStyle: TagStyle {

    /// Creates a new `SecondaryTagStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        self.buildDefaultLayout(configuration: configuration,
                                tagPath: "tag-secondary",
                                variant: configuration.variant,
                                padded: configuration.padded)
    }
}

public extension TagStyle where Self == SecondaryTagStyle {

    /// Convenience var to create a new `TagStyle` of type `SecondaryTagStyle`
    static var secondary: some TagStyle { return SecondaryTagStyle() }
}
