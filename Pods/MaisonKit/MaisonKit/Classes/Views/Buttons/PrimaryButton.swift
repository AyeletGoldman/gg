// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A styled primary button
public struct PrimaryButton: View, Identifiable {

    /// The view indentifier. In use for view iteration.
    public let id = UUID()
    private let buttonData: ButtonData
    private let variant: ButtonVariantType?
    private let isLoading: Bool

    /// Creates an instance of `PrimaryButton`
    /// - Parameters:
    ///   - buttonData: The button data
    ///   - variant: Optional. A set of variants available for buttons
    ///   - isLoading: Whether the button already tapped and should show an animated spinner.
    public init(buttonData: ButtonData,
                variant: ButtonVariantType? = nil,
                isLoading: Bool = false) {
        self.buttonData = buttonData
        self.variant = variant
        self.isLoading = isLoading
    }

    public var body: some View {
        StyledButton.fullWidthPaddedButton(data: self.buttonData,
                                           style: ButtonIdentifier.primary,
                                           variant: self.variant,
                                           isLoading: self.isLoading)
    }
}
