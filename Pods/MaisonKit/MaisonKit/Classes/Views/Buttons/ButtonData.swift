// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// Defines the position of the icon in the button
public enum IconPosition {
    /// The icon will be placed before the text in the button
    case leading
    /// The icon will be placed after the text in the button
    case trailing
}

/// A generic button data for defining the buttons in the app
public struct ButtonData: Identifiable {
    public let id = UUID()
    let label: String
    let icon: StylistIdentifier?
    let iconPosition: IconPosition
    let badge: String?
    let isEnabled: Bool
    let action: () -> Void

    /// Creates an instance of `ButtonData`
    /// - Parameters:
    ///   - label: The button label
    ///   - icon: An optional icon to show next to the label
    ///   - iconPosition: The position of the icon in the label. Defaults to `.leading`.
    ///   Setting this will change the position of the icon in the button.
    ///   - badge: An optional badge to show in the button corner
    ///   - isEnabled: Whether the button should be enabled or not
    ///   - action: The action to perform when clicking the button
    public init(label: String,
                icon: StylistIdentifier? = nil,
                iconPosition: IconPosition = .leading,
                badge: String? = nil,
                isEnabled: Bool = true,
                action: @escaping (() -> Void)) {
        self.label = label
        self.icon = icon
        self.iconPosition = iconPosition
        self.badge = badge
        self.isEnabled = isEnabled
        self.action = action
    }
}
