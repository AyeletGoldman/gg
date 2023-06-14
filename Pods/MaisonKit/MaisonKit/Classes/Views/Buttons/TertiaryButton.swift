// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A styled tertiary button
public struct TertiaryButton: View, Identifiable {

    /// The view indentifier. In use for view iteration.
    public let id = UUID()
    private let buttonData: ButtonData
    private let variant: ButtonVariantType?

    /// Creates an instance of `TertiaryButton`
    /// - Parameters:
    ///   - buttonData: The button data
    ///   - variant: Optional. A set of variants available for buttons
    public init(buttonData: ButtonData, variant: ButtonVariantType? = nil) {
        self.buttonData = buttonData
        self.variant = variant
    }

    public var body: some View {
        StyledButton(buttonData: self.buttonData,
                     style: ButtonIdentifier.tertiary,
                     variant: self.variant,
                     iconSize: .small)
    }
}

struct TertiaryButtonLabel: View {

    let text: String
    let icon: StylistIdentifier?
    let badge: String?

    init(text: String,
         icon: StylistIdentifier? = nil,
         badge: String? = nil) {
        self.text = text
        self.icon = icon
        self.badge = badge
    }

    var body: some View {
        StylableGroup(ButtonIdentifier.tertiary.description) {
            StyledButtonLabel(text: self.text, icon: self.icon, badge: self.badge)
        }
    }
}
