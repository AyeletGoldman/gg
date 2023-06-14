// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

/// An identifier for buttons that specifies the styling they will receive.
/// MaisonKit provides `.primary`, `.secondary`, and `.tertiary` but
/// custom identifiers can also be used. If you use a custom identifier, make sure it is
/// available in your stylist theme.
public typealias ButtonIdentifier = StylistIdentifier

public extension ButtonIdentifier {

    /// A primary button identifier. Will style the button as a "primary" button.
    static let primary: ButtonIdentifier = "button-primary"
    /// A secondary button identifier. Will style the button as a "secondary" button.
    static let secondary: ButtonIdentifier = "button-secondary"
    /// A tertiary button identifier. Will style the button as a "tertiary" button.
    static let tertiary: ButtonIdentifier = "button-tertiary"
    /// An alert button identifier. Will style the button as a "alert" button.
    static let alert: ButtonIdentifier = "button-alert"
}

/// An action associated with a button.
public struct ButtonAction {

    /// The identifier for the button, this property allows you to specify the styling of the button
    public let buttonIdentifier: ButtonIdentifier
    /// The type of the action
    public let action: ContextualAction

    /// Creates a new `AnyButtonAction` with the given action and button identifier.
    /// - Parameters:
    ///   - buttonIdentifier: the identifier for the button
    ///   - action: the action to be performed
    public init(buttonIdentifier: ButtonIdentifier = .primary,
                action: ContextualAction) {
        self.buttonIdentifier = buttonIdentifier
        self.action = action
    }
}
