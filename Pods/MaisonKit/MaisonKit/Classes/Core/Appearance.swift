// Copyright © 2020 LVMH. All rights reserved.

import Foundation
import StylableSwiftUI

final class MaisonKitAppearance {
    static func getTextAttributes(for identifier: StylistIdentifier, in styleContainer: UIKitStyleContainer) -> [NSAttributedString.Key: Any] {
        var attributes = [NSAttributedString.Key: Any]()
        if let textColor = styleContainer.textColor(for: identifier) {
            attributes[.foregroundColor] = textColor
        }
        if let font = styleContainer.font(for: identifier) {
            attributes[.font] = font
        }
        if let kerning = styleContainer.kerning(for: identifier) {
            attributes[.kern] = kerning
        }

        return attributes
    }
}

extension UINavigationBarAppearance {
    convenience init(styleContainer: UIKitStyleContainer,
                     shadowColorIdentifier: StylistIdentifier,
                     backButtonIdentifier: StylistIdentifier,
                     backgroundColorIdentifier: StylistIdentifier,
                     backIndicatorImageIdentifier: StylistIdentifier,
                     transitionMaskImageIdentifier: StylistIdentifier,
                     titleIdentifier: StylistIdentifier) {
        self.init()
        self.configureWithOpaqueBackground()
        self.shadowColor = styleContainer.backgroundColor(for: shadowColorIdentifier)
        self.backgroundColor = styleContainer.backgroundColor(for: backgroundColorIdentifier)
        self.shadowImage = UIImage()
        self.backButtonAppearance.normal.titleTextAttributes = MaisonKitAppearance.getTextAttributes(for: backButtonIdentifier,
                                                                                                     in: styleContainer)
        self.backButtonAppearance.highlighted.titleTextAttributes = MaisonKitAppearance.getTextAttributes(for: backButtonIdentifier,
                                                                                                          in: styleContainer)
        self.setBackIndicatorImage(styleContainer.uiImage(for: backIndicatorImageIdentifier),
                                   transitionMaskImage: styleContainer.uiImage(for: transitionMaskImageIdentifier))
        self.titleTextAttributes = MaisonKitAppearance.getTextAttributes(for: titleIdentifier, in: styleContainer)
    }
}
