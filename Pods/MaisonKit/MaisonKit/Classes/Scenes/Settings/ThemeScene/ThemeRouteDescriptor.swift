//  Copyright © 2021 LVMH. All rights reserved.

/// The descriptor for the theme's feature
public struct ThemeRouteDescriptor: RouteDescriptor {

    /// The identifier for thsi route
    public static let identifier: Identifier = "ThemeRouteDescriptor"

    let themes: ThemeDisplayable
    let onSelectionChanged: (ThemeIdentifier) -> Void

    /// Creates a new route descriptor for the themes screen
    /// - Parameters:
    ///   - themes: the displayable that contains the information on the currently selected theme and any available themes
    ///   - onSelectionChanged: a closure to invoke when the selected theme has changed
    public init(themes: ThemeDisplayable,
                onSelectionChanged: @escaping (ThemeIdentifier) -> Void) {
        self.themes = themes
        self.onSelectionChanged = onSelectionChanged
    }
}
