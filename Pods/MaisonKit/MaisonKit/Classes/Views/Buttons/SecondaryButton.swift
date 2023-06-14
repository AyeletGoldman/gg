// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A styled secondary button
public struct SecondaryButton: View {

    private let buttonData: ButtonData
    private let variant: ButtonVariantType?

    /// Creates an instance of `SecondaryButton`
    /// - Parameters:
    ///   - buttonData: The button data
    ///   - variant: Optional. A set of variants available for buttons
    public init(buttonData: ButtonData, variant: ButtonVariantType? = nil) {
        self.buttonData = buttonData
        self.variant = variant
    }

    public var body: some View {
        StyledButton.fullWidthPaddedButton(data: self.buttonData,
                                           style: ButtonIdentifier.secondary,
                                           variant: self.variant)
    }
}
