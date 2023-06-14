// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// The default form type picklist style.
public struct DefaultFormTypePicklistStyle: FormTypePicklistStyle {

    /// Creates a new `DefaultFormTypePicklistStyle`.
    public init() { }

    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.title
            if let badge = configuration.badge {
                Spacer().frame(width: 4)
                badge
            }
            Spacer()
            if let subtitle = configuration.subtitle {
                subtitle
            }
            configuration.icon
        }
    }
}

public extension FormTypePicklistStyle where Self == DefaultFormTypePicklistStyle {

    /// Convenience var to create a new `FormTypePicklistStyle` of type `DefaultFormTypePicklistStyle`
    static var `default`: some FormTypePicklistStyle { return DefaultFormTypePicklistStyle() }
}
