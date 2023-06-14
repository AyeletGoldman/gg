// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A custom cell to display on the settings screen.
/// These are usually displayed below the cells provided by MaisonKit by default in the settings screen.
public typealias SettingsCell = CustomisableActionCell

public extension SettingsCell {

    /// Creates a new `SettingsCell` with the default configuration for the view.
    /// Use this initializer to create a custom cell that looks the same as the rest of the cells in the settings view, but for which you want to provide your own custom action.
    /// This initializer creates a `SettingsCell` whose `cellProvider` returns a `ListItemView`.
    /// - Parameters:
    ///   - id: The ID for this cell. Used to arrange the layout and provide support for animating.
    ///   - displayable: A displayable that contains the data to display in the view.
    ///   - action: Optional. An action to perform when the cell is tapped. If this is `nil`, the cell will not be tappable.
    init(id: UUID = UUID(), displayable: SettingsActionDisplayable, action: ActionType?) {
        self.init(id: id.uuidString,
                  cellProvider: {
            return ListItemView(title: displayable.title,
                                subtitle: displayable.subtitle,
                                icon: displayable.icon,
                                axis: displayable.axis)
        }, action: action)
    }
}
