import Foundation
import StylableSwiftUI
import MaisonKit

extension NetworkAdapter: SettingsAdapter {

    func fetchAvailableThemes() -> ThemeDisplayable {
        return ThemeDisplayable(availableThemes: [], selectedThemeIdentifier: "")
    }

    func didSelectTheme(identifier: ThemeIdentifier) {

    }
}
