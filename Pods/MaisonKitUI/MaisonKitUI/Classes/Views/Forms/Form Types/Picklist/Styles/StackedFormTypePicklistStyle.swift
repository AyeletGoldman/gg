// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A stacked form type picklist style. The difference between this style and the default one is that the title and subtitle are stacked on a `VStack` if there is a subtitle.
public struct StackedFormTypePicklistStyle: FormTypePicklistStyle {

    /// Creates a new `StackedFormTypePicklistStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                configuration.title
                if let subtitle = configuration.subtitle {
                    subtitle
                }
            }

            if let badge = configuration.badge {
                Spacer().frame(width: 4)
                badge
            }
            Spacer()
            configuration.icon
        }
    }
}

public extension FormTypePicklistStyle where Self == StackedFormTypePicklistStyle {

    /// Convenience var to create a new `FormTypePicklistStyle` of type `StackedFormTypePicklistStyle`
    static var stacked: some FormTypePicklistStyle { return StackedFormTypePicklistStyle() }
}
