// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import SwiftUI
import StylableSwiftUI

typealias StyledIconSize = CGSize

extension StyledIconSize {
    static let small = StyledIconSize(width: 12, height: 12)
    static let medium = StyledIconSize(width: 20, height: 20)
}

/// A set of variants available for buttons
public enum ButtonVariantType: String {
    /// The button is in a highlighted state
    case highlighted
    /// The button is in a selected state
    case selected
    /// The button is in a focused state
    case focused
    /// The button is in a error state
    case error
}

struct StyledButton: View {

    let buttonData: ButtonData
    let variant: ButtonVariantType?
    let style: ButtonIdentifier
    let iconSize: StyledIconSize
    let padding: EdgeInsets?
    let fullWidth: Bool
    private var isLoading: Bool

    init(buttonData: ButtonData,
         style: ButtonIdentifier,
         variant: ButtonVariantType? = nil,
         iconSize: StyledIconSize,
         padding: EdgeInsets? = nil,
         fullWidth: Bool = false,
         isLoading: Bool = false) {
        self.buttonData = buttonData
        self.variant = variant
        self.style = style
        self.iconSize = iconSize
        self.padding = padding
        self.fullWidth = fullWidth
        self.isLoading = isLoading
    }

    var buttonAction: () -> Void {
        return self.buttonData.isEnabled && !self.isLoading ?
            self.buttonData.action : { }
    }

    func getStyleName() -> String {
        let variantString = self.buttonData.isEnabled ? self.variant?.rawValue : "disabled"
        return StylistIdentifier.buildFullIdentifier(for: self.style, variant: variantString)
    }

    var body: some View {
        StylableGroup(self.getStyleName()) {
            Button(action: self.buttonAction) {
                StyledButtonLabel(text: self.buttonData.label,
                                  icon: self.buttonData.icon,
                                  iconPosition: self.buttonData.iconPosition,
                                  badge: self.buttonData.badge,
                                  iconSize: self.iconSize,
                                  padding: self.padding,
                                  isFullWidth: self.fullWidth,
                                  isLoading: self.isLoading)
            }
            .buttonStyle(NoAnimationButtonStyle(if: !self.buttonData.isEnabled || self.isLoading))
        }
    }
}

extension StyledButton {
    @ViewBuilder
    static func fullWidthPaddedButton(data: ButtonData,
                                      style: ButtonIdentifier,
                                      variant: ButtonVariantType? = nil,
                                      iconSize: StyledIconSize = .medium,
                                      isLoading: Bool = false) -> some View {
        StyledButton(buttonData: data,
                     style: style,
                     variant: variant,
                     iconSize: iconSize,
                     padding: EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16),
                     fullWidth: true,
                     isLoading: isLoading)
    }
}
