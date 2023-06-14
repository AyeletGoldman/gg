// Copyright © 2020 LVMH. All rights reserved.

import UIKit
import SwiftUI

/// A representation of a button used in a navigation bar
public struct NavigationButton {

    /// The navigation button can be either text, an image, or a loading spinner
    public enum Title {
        /// The text version of the navigation button (displays the associated `String`)
        case text(String)
        /// The image version of the navigation button (displays the image from the given `ImageSource`
        case image(ImageSource)
        /// The loading version of the navigation button (displays a loading spinner)
        case loading
    }

    let title: Title
    let action: () -> Void
    let accessibilityIdentifier: String?
    let isEnabled: Bool
    let badgeTitle: String?

    /// Creates a new `NavigationButton`
    /// - Parameters:
    ///   - title: The navigation button can be either text, an image, or a loading spinner
    ///   - accessibilityIdentifier: an accessibility identifier to give to the button. Defaults to `nil`.
    ///   - isEnabled: whether the button will be enabled or not. Defaults to `true`.
    ///   - badgeTitle: a string to display in a badge on the top right of the navigation button. Defaults to `nil`.
    ///   - action: a closure to invoke when the navigation button is pressed.
    public init(title: Title, accessibilityIdentifier: String? = nil, isEnabled: Bool = true, badgeTitle: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.accessibilityIdentifier = accessibilityIdentifier
        self.isEnabled = isEnabled
        self.badgeTitle = badgeTitle
    }
}

public extension NavigationButton {
    /// A loading navigation button
    static var loading: NavigationButton {
        return NavigationButton(title: .loading, isEnabled: false, action: {})
    }
}
