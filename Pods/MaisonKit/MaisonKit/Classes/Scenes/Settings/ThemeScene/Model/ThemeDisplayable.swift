// Copyright © 2021 LVMH. All rights reserved.

import Foundation

/// A container for the data needed by the SDK to show the themes user interface
public struct ThemeDisplayable {

    /// A theme represents a set of styles that should be applied to the user interface.
    public struct Theme {

        /// The theme's identifier - a value that will usually be the same as the value the stylist uses to swap themes
        public let identifier: ThemeIdentifier

        /// A display value for the theme's name. The SDK expects this to be localised.
        public let displayName: String

        /// A closure to invoke when this theme has been selected
        public let onSelect: () -> Void

        /// Creates a new `Theme`.
        /// - Parameters:
        ///   - identifier: The theme's identifier - a value that will usually be the same as the value the stylist uses to swap themes
        ///   - displayName: A display value for the theme's name. The SDK expects this to be localised.
        ///   - onSelect: a closure to invoke when this theme has been selected.
        public init(identifier: ThemeIdentifier, displayName: String, onSelect: @escaping () -> Void) {
            self.identifier = identifier
            self.displayName = displayName
            self.onSelect = onSelect
        }
    }

    /// A list of themes available to switch to
    public let availableThemes: [Theme]
    /// An identifier for the currently-active theme
    public let selectedThemeIdentifier: ThemeIdentifier

    /// Creates a new `ThemeDisplayable`
    /// - Parameters:
    ///   - availableThemes: A list of themes available to switch to
    ///   - selectedThemeIdentifier: An identifier for the currently-active theme
    public init(availableThemes: [Theme], selectedThemeIdentifier: ThemeIdentifier) {
        self.availableThemes = availableThemes
        self.selectedThemeIdentifier = selectedThemeIdentifier
    }

    fileprivate init() {
        self.availableThemes = []
        self.selectedThemeIdentifier = ""
    }
}
