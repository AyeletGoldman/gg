// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// The primary icon tag style.
public struct PrimaryIconTagStyle: TagStyle {

    /// Creates a new `PrimaryIconTagStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: "tag-primary-icon", variant: configuration.variant)) {
            configuration.icon
                .frame(width: 16, height: 16)
                .padding(.horizontal, 2)
                .padding(.vertical, 2)
                .style("background")
        }
    }
}

public extension TagStyle where Self == PrimaryIconTagStyle {

    /// Convenience var to create a new `TagStyle` of type `PrimaryIconTagStyle`
    static var primaryIcon: some TagStyle { return PrimaryIconTagStyle() }
}
