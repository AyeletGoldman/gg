// Copyright © 2021 LVMH. All rights reserved.

import Foundation
import Combine

/// An adapter for the settings feature of MaisonKit
public protocol SettingsAdapter {

    /// Asks the implementer to return the available themes for the app.
    /// The minimum implementation of this should return a `dark`, `light` and `system` set of themes.
    /// - Returns: A displayable with a list of themes to support, as well as the currently selected theme identifier.
    func fetchAvailableThemes() -> ThemeDisplayable

    /// Informs the implementer that the selected theme has changed
    /// - Parameter identifier: the theme identifier of the theme that was selected
    func didSelectTheme(identifier: ThemeIdentifier)

    /// Asks the implementer to return a list of additional settings cells that are to be displayed in the settings scene.
    /// - Returns: A publisher which, on success, will return a list of `SettingsCell` to be appended at the end of the
    /// cells provided by MaisonKit.
    func additionalSettingsActions() -> AnyPublisher<Result<[SettingsCell], ErrorDisplayable>, Error>
}

public extension SettingsAdapter {

    /// Default implementation for themes, returns an empty displayable which in turn disables the themes UI in settings
    /// - Returns: an empty displayable
    func fetchAvailableThemes() -> ThemeDisplayable {
        return ThemeDisplayable(availableThemes: [], selectedThemeIdentifier: "")
    }

    /// Default implementation. This does nothing.
    /// - Parameter identifier: the theme identifier of the theme that was selected
    func didSelectTheme(identifier: ThemeIdentifier) { }

    /// Asks the implementer to return a list of additional settings cells that are to be displayed in the settings scene.
    /// - Returns: A publisher which, on success, will return a list of `SettingsCell` to be appended at the end of the
    /// cells provided by MaisonKit.
    /// This default implementation returns an empty array immediately.
    func additionalSettingsActions() -> AnyPublisher<Result<[SettingsCell], ErrorDisplayable>, Error> {
        return Just(.success([])).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
