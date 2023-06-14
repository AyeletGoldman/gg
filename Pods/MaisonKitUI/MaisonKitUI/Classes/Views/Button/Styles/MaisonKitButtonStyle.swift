// Copyright © 2023 LVMH. All rights reserved.

import SwiftUI
import StylableSwiftUI

/// A custom button style provided by MaisonKit. This implementation of `ButtonStyle` is used for larger buttons like primary, secondary and alert buttons.
/// The style takes into account environment rules and configuration options from the button to decide the variants that should be applied to the button's stylist identifier.
public struct MaisonKitButtonStyle: ButtonStyle {

    /// The identifier for the group that will wrap the button
    public let identifier: String

    public let padding: EdgeInsets

    @Environment(\.isEnabled) private var isEnabled

    /// Creates a new `MaisonKitButtonStyle` with the given identifier.
    /// - Parameter identifier: the stylist identifier for the group that will wrap the button
    public init(identifier: String, padding: EdgeInsets = EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)) {
        self.identifier = identifier
        self.padding = padding
    }

    public func makeBody(configuration: Configuration) -> some View {
        StylableGroup(StylistIdentifier.buildFullIdentifier(for: self.identifier, variant: self.getVariant(for: configuration))) {
            configuration.label
                .padding(self.padding)
                .style("background")
        }
    }

    private func getVariant(for configuration: Configuration) -> String? {
        guard self.isEnabled else {
            return "disabled"
        }

        return configuration.isPressed ? "highlighted" : nil
    }
}
