// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A style to indicate presentation style
public enum PresentationStyle {
    /// A modal presentation style
    case modal(embedInNavigationController: Bool = true, detents: [UISheetPresentationController.Detent]? = nil)
    /// A push presentation style
    case push
    /// A full screen modal presentation style
    case fullScreenModal(embedInNavigationController: Bool)
}

public extension PresentationStyle {
    /// A convenience to create a `.modal` `PresentationStyle` embedded in a `StylableNavigationController`
    static var modal: PresentationStyle {
        return .modal()
    }

    /// A convenience to create a `.fullScreenModal` `PresentationStyle` embedded in a `StylableNavigationController`
    static var fullScreenModal: PresentationStyle {
        return .fullScreenModal(embedInNavigationController: true)
    }
}
