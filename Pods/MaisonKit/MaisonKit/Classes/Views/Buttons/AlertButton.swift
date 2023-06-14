// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

/// A styled alert button
public struct AlertButton: View {

    private let buttonData: ButtonData
    private let isLoading: Bool

    /// Creates an instance of `AlertButton`
    /// - Parameters:
    ///   - buttonData: The button data
    ///   - isLoading: Whether the button already tapped and should show an animated spinner.
    public init(buttonData: ButtonData,
                isLoading: Bool = false) {
        self.buttonData = buttonData
        self.isLoading = isLoading
    }

    public var body: some View {
        StyledButton.fullWidthPaddedButton(data: self.buttonData,
                                           style: ButtonIdentifier.alert,
                                           isLoading: self.isLoading)
    }
}
