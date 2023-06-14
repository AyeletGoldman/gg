// Copyright © 2022 LVMH. All rights reserved.

import Foundation
import SwiftUI

/// A custom cell to display on lists that allows the creator to provide their own user interface.
public struct CustomisableActionCell: Identifiable {

    /// The ID for this cell. Used to arrange the layout and provide support for animating.
    public let id: String
    /// A closure that will create the view to display.
    public let cellProvider: () -> AnyView
    /// Optional. An action to perform when the cell is tapped. If this is `nil`, the cell will not be tappable.
    public let action: ActionType?

    /// Creates a new `SettingsCell`
    /// Use this initializer for more control over the cell that is displayed. This gives you more control over the cell and the contents of it.
    /// You may create any view you want in the `cellProvider` closure, but it will usually be wrapped in a `StylistGroup` that reflects its location.
    /// Note: This is an advanced feature for easy customisation. In most cases, the recommended approach is to use one of the convenience initialisers for the feature you
    /// are implementing.
    /// - Parameters:
    ///   - id: The ID for this cell. Used to arrange the layout and provide support for animating.
    ///   - cellProvider: A closure that will create the view to display.
    ///   - action: Optional. An action to perform when the cell is tapped. If this is `nil`, the cell will not be tappable. Defaults to `nil`.
    public init<V: View>(id: String = UUID().uuidString, cellProvider: @escaping () -> V, action: ActionType? = nil) {
        self.id = id
        self.cellProvider = { cellProvider().eraseToAnyView() }
        self.action = action
    }
}
